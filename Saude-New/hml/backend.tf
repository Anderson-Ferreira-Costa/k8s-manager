terraform {
  backend "s3" {
    bucket = "terraform-tfstate-243340205326"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
