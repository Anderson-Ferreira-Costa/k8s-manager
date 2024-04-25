region = "sa-east-1"

#somaorcamento-prd-sa-east-1-vpc
vpc_id    = "vpc-02806f964ef00890d"

#SUBNET somaorcamento-prd-sa-east-1-private-subnet-az1 - 10.34.51.0/26
subnet_id = "subnet-0cae3092a973ac813"

name                        = "eks_manager_prd"
instance_type               = "t3a.small"
ami                         = "ami-09eaa84f7aa85cc0e"   # PSG-IAAS-LINUX-AMZN2-20230131094000
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