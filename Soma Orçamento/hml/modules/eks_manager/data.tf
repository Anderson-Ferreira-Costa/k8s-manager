data "aws_ami" "amazon_linux" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      #   "amzn2-ami-hvm-2.0.20210813.1-x86_64-gp2"
      "amzn2-ami-hvm-2.0.20211201.0-x86_64-gp2"
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}
