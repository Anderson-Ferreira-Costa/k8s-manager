terraform {
  backend "s3" {
    bucket = "terraform-tfstate-918634344661"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
