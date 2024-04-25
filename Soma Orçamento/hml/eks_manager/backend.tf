terraform {
  backend "s3" {
    bucket = "terraform-tfstate-631191083149"
    key    = "infraestrutura/eks_manager/terraform.tfstate"
    region = "ca-central-1"
  }
}
