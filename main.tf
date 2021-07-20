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

module "ec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"

  name                   = "ec2-gabs-tf-labs"
  instance_count         = 1

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name               = "gabs_keypair_sa_east_1"
  vpc_security_group_ids = ["sg-08380ffaa5110ce89"]
  subnet_id              = "subnet-153d9b4e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}