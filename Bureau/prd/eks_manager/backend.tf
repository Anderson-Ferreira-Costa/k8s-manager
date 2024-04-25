terraform {
  backend "s3" {
    bucket = "projeto-bureau-prd-terraform-states-bucket"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "us-east-1"
  }
}
