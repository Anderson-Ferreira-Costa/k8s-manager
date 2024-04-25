region = "ca-central-1"

#VPC OPENINSURANCE-EKS-HML
vpc_id = "vpc-0536d9c3e0d9b3e4e"

#SUBNET OPENINSURANCE-EKS-HML-private-ca-central-1a - 10.33.154.0/26
subnet_id = "subnet-0808ddb5ac7cbc2e8"

name          = "eks_manager_hml"
instance_type = "t3a.small"
ami           = "ami-08b4f41bc0ef01469" # PSG-IAAS-LINUX-AMZN2-20230131094000
# key_name                    = "asd"                   # Opcional (Insira o nome da chave existente na conta)
# vpc_security_group_ids      = [ "asd" ]               # Opcional (insira o id do security group)
user_data_file_path = "./script/user_data.sh" # Opcional (Caso não seja específicado, pega da pasta script)

use_user_data               = true
associate_public_ip_address = false

metadata_options = {
  "http_put_response_hop_limit" = 2,
  "http_tokens"                 = "required"
}

tags = {
  "Name" = "eks_manager_hml"
}