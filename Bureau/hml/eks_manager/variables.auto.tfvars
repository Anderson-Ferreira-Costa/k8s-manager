region = "us-east-1"

vpc_id    = "vpc-010c86f303706cd09"
subnet_id = "subnet-079562556125b4ba7"

name                        = "eks_manager_hml"
instance_type               = "t3a.small"
ami                         = "ami-0395072cf41250cbf"   # Opcional (Insira o id da ami desejada)
# key_name                    = "asd"                   # Opcional (Insira o nome da chave existente na conta)
# vpc_security_group_ids      = [ "asd" ]               # Opcional (insira o id do security group)
user_data_file_path         = "./script/user_data.sh"   # Opcional (Caso não seja específicado, pega da pasta script)

use_user_data               = true
associate_public_ip_address = false

metadata_options = {
  "http_put_response_hop_limit" = 2,
  "http_tokens"                 = "required"
}

tags = {
  "Name" = "eks_manager_hml"
}