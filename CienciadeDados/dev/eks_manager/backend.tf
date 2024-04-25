terraform {
  backend "s3" {
    bucket = "cienciadedados-dev-tf-bcp"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
