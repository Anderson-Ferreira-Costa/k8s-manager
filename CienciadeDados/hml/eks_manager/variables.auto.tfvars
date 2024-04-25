region = "ca-central-1"

#VPC CIENCIADEDADOS-EKS-HML
vpc_id    = "vpc-0aad25418de410207"

#SUBNET CIENCIADEDADOS-EKS-HML-private-ca-central-1a - 10.33.81.0/26
subnet_id = "subnet-0c6bd08d8b6ecc6f3"

name                        = "eks_manager_hml"
instance_type               = "t3a.small"
ami                         = "ami-08b4f41bc0ef01469"   # PSG-IAAS-LINUX-AMZN2-20230131094000
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