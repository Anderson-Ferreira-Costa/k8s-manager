region = "sa-east-1"

#somaorcamento-hml-sa-east-1-vpc
vpc_id    = "vpc-019934650d3501f83"

#SUBNET somaorcamento-hml-sa-east-1-private-subnet-az1 - 10.34.50.0/26
subnet_id = "subnet-036289a81edc1824f"

name                        = "eks_manager_hml"
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
  "Name" = "eks_manager_hml"
}