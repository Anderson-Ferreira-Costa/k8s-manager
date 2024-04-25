module "sample" {
  source = "../modules/eks_manager"

  region = var.region

  name                        = var.name
  ami                         = var.ami
  vpc_security_group_ids      = var.vpc_security_group_ids
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  metadata_options            = var.metadata_options
  use_user_data               = var.use_user_data
  user_data_file_path         = var.user_data_file_path
  tags                        = var.tags
}