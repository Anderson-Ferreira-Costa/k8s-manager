terraform {
  backend "s3" {
    bucket = "cienciadedados-hml-bcp"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
