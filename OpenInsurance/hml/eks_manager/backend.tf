terraform {
  backend "s3" {
    bucket = "openinsurance-hml-tf-bcp"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
