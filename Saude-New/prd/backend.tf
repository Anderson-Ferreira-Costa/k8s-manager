terraform {
  backend "s3" {
    bucket = "terraform-tfstate-255870312854"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}