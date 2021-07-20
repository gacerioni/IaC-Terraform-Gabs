provider "aws" {
  region = "sa-east-1"
}

locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Gabs!"
EOF
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

resource "aws_eip" "this" {
  vpc      = true
  instance = module.ec2.id[0]
}

resource "aws_kms_key" "this" {
}

resource "aws_network_interface" "this" {
  count = 1

  subnet_id = tolist(data.aws_subnet_ids.all.ids)[count.index]
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2-size
  subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]

  tags = {
    Name = "HelloWorld"
  }
}