data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["PSG-IAAS-LINUX-AMZN2*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["722846928525"]
}


data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

# Seleciona a primeira subnet da lista
data "aws_subnet" "subnet" {
  id = element(data.aws_subnets.subnets.ids, 1)
}

