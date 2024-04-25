terraform {
  backend "s3" {
    bucket = "cienciadedados-prd-tf-bcp"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
