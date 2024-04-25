terraform {
  backend "s3" {
    bucket = "projeto-bureau-dev-terraform-states-bucket"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
