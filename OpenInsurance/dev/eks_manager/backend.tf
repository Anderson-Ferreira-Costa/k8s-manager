terraform {
  backend "s3" {
    bucket = "opin-dev-terraform-bcp"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
