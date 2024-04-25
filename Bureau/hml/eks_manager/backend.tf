terraform {
  backend "s3" {
    bucket = "bureau-eks-terraform"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "us-east-1"
  }
}
