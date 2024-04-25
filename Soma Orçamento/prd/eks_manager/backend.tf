terraform {
  backend "s3" {
    bucket = "terraform-tfstate-465033080535"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
