# ## Creates a key pair for EC2 and stores it in AWS Secrets Manager ##
# resource "tls_private_key" "key" {
#   count     = var.key_name != null ? 0 : 1
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "keypair" {
#   count           = var.key_name != null ? 0 : 1
#   key_name_prefix = var.name
#   public_key      = tls_private_key.key[0].public_key_openssh
# }

# resource "aws_secretsmanager_secret" "secret_key" {
#   count       = var.key_name != null ? 0 : 1
#   name_prefix = var.name
#   description = "Secrets para ec2."
#   tags = merge(
#     var.tags,
#     { "Name" : "${var.name}-key" }
#   )
# }

# resource "aws_secretsmanager_secret_version" "secret_key_value" {
#   count         = var.key_name != null ? 0 : 1
#   secret_id     = aws_secretsmanager_secret.secret_key[0].id
#   secret_string = tls_private_key.key[0].private_key_pem
# }


## AWS EC2 Instance creation ###
resource "aws_instance" "this" {
  ami                  = var.ami == null ? data.aws_ami.amazon_linux.id : var.ami
  instance_type        = var.instance_type
  cpu_core_count       = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core
  user_data            = var.user_data_file_path != "" && fileset(var.user_data_file_path, "*") != [] && var.use_user_data ? file(var.user_data_file_path) : null
  user_data_base64     = var.user_data_base64
  hibernation          = var.hibernation

  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id != null ? var.subnet_id : data.aws_subnet.subnet.id
  vpc_security_group_ids = var.vpc_security_group_ids == null ? [aws_security_group.eks_manager.id] : var.vpc_security_group_ids

  # key_name             = var.key_name != null ? var.key_name : length(aws_key_pair.keypair) > 0 ? aws_key_pair.keypair[0].key_name : null
  monitoring           = var.monitoring
  get_password_data    = var.get_password_data
  iam_instance_profile = var.iam_instance_profile == null ? aws_iam_role.manager.name : var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = var.private_ip
  secondary_private_ips       = var.secondary_private_ips
  ipv6_address_count          = var.ipv6_address_count
  ipv6_addresses              = var.ipv6_addresses

  ebs_optimized = var.ebs_optimized

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification != null ? [var.capacity_reservation_specification] : []
    content {
      capacity_reservation_preference = lookup(capacity_reservation_specification.value, "capacity_reservation_preference", null)

      dynamic "capacity_reservation_target" {
        for_each = lookup(capacity_reservation_specification.value, "capacity_reservation_target", [])
        content {
          capacity_reservation_id = lookup(capacity_reservation_target.value, "capacity_reservation_id", null)
        }
      }
    }
  }

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      throughput            = lookup(root_block_device.value, "throughput", null)
      tags                  = lookup(root_block_device.value, "tags", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
      throughput            = lookup(ebs_block_device.value, "throughput", null)
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = lookup(ephemeral_block_device.value, "no_device", null)
      virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []
    content {
      http_endpoint               = lookup(metadata_options.value, "http_endpoint", "enabled")
      http_tokens                 = lookup(metadata_options.value, "http_tokens", "optional")
      http_put_response_hop_limit = lookup(metadata_options.value, "http_put_response_hop_limit", "1")
      instance_metadata_tags      = lookup(metadata_options.value, "instance_metadata_tags", null)
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", false)
    }
  }

  dynamic "launch_template" {
    for_each = var.launch_template != null ? [var.launch_template] : []
    content {
      id      = lookup(var.launch_template, "id", null)
      name    = lookup(var.launch_template, "name", null)
      version = lookup(var.launch_template, "version", null)
    }
  }

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  source_dest_check                    = length(var.network_interface) > 0 ? null : var.source_dest_check
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  placement_group                      = var.placement_group
  tenancy                              = var.tenancy
  host_id                              = var.host_id

  credit_specification {
    cpu_credits = local.is_t_instance_type ? var.cpu_credits : null
  }

  timeouts {
    create = lookup(var.timeouts, "create", null)
    update = lookup(var.timeouts, "update", null)
    delete = lookup(var.timeouts, "delete", null)
  }

  tags        = merge({ "Name" = var.name }, var.tags)
  volume_tags = var.enable_volume_tags ? merge({ "Name" = var.name }, var.volume_tags) : null
}

## Security Group to EC2 instance ##
resource "aws_security_group" "eks_manager" {
  name                   = "SG-EC2-${var.name}"
  description            = "SG-EC2-${var.name}"
  vpc_id                 = var.vpc_id != null ? var.vpc_id : data.aws_subnet.subnet.vpc_id
  revoke_rules_on_delete = true

  # ingress {
  #   cidr_blocks = ["172.16.0.0/12"]
  #   description = ""
  #   from_port   = 22
  #   protocol    = "tcp"
  #   to_port     = 22
  # }

  egress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  tags = {
    Name = "SG-EC2-${var.name}"
  }
}
