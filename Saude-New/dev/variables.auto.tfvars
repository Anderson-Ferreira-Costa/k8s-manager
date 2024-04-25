region = "ca-central-1"
# vpc_id    = "vpc-0a05120f94f446715"
# subnet_id = "subnet-09771d2e658b93b51"

name          = "eks_manager_dev"
instance_type = "t3a.small"
# ami                         = "ami-08b4f41bc0ef01469"   # PSG-IAAS-LINUX-AMZN2-20230131094000
# key_name                    = "asd"                   # Opcional (Insira o nome da chave existente na conta)
# vpc_security_group_ids      = [ "asd" ]               # Opcional (insira o id do security group)

use_user_data               = true
associate_public_ip_address = false

metadata_options = {
  "http_put_response_hop_limit" = 2,
  "http_tokens"                 = "required"
}

tags = {
  "Name" = "eks_manager_dev"
}