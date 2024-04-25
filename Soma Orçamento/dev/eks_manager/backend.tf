terraform {
  backend "s3" {
    bucket = "terraform-tfstate-694986898952"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
