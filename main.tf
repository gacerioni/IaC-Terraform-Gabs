provider "aws" {
  region = "sa-east-1"
}


data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "harness-server" {
  ami           = data.aws_ami.amazon-2.id
  instance_type = var.instancetype

  tags = var.tags
}
