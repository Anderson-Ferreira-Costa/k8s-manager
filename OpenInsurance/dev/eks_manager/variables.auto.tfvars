region = "ca-central-1"

#VPC OPENINSURANCE-EKS-DEV
vpc_id = "vpc-02f4ab8758b232a30"

#SUBNET OPENINSURANCE-EKS-DEV-private-ca-central-1a - 10.33.153.0/26
subnet_id = "subnet-0ad7e49efd80edee4"

name          = "eks_manager_dev"
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
  "Name" = "eks_manager_dev"
}