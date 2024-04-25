terraform {
  backend "s3" {
    bucket = ""
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
