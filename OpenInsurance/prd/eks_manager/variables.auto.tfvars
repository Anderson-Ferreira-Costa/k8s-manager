region = "ca-central-1"

#VPC OPENINSURANCE-EKS-PRD-NEW
vpc_id    = "vpc-02dde6fcf8751e049"

#SUBNET OPENINSURANCE-EKS-PRD-NEW-private-ca-central-1a - 10.34.203.0/25
subnet_id = "subnet-0bfcc47b315e51fac"

name                        = "eks_manager_prd"
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
  "Name" = "eks_manager_prd"
}