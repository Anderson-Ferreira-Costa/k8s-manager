region = "us-east-1"

#VPC cienciadedados-prd
vpc_id    = "vpc-0de21cdde567ce8ca"

#SUBNET cienciadedados-prd-private-ca-central-1a - 10.33.76.0/26
subnet_id = "subnet-0021c4130004458a4"

name                        = "eks_manager_prd"
instance_type               = "t3a.small"
ami                         = "ami-0395072cf41250cbf"   # PSG-IAAS-LINUX-AMZN2-20230131094000
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
  "Name" = "eks_manager_prd"
}