provider "aws" {
  region = "sa-east-1"
}

locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Gabs!"
EOF
}

terraform {
  backend "s3" {
    bucket = "gabs-terraform-state"
    key    = "terraformgabsec2.tfstate"
    region = "sa-east-1"
  }
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
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

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "ec2-gabs-tf-labs-sg"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "3.5.0"

  name                   = "ec2-gabs-tf-labs"

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.ec2-size
  key_name               = var.key-pair
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = tolist(data.aws_subnets.all.ids)[0]

  associate_public_ip_address = true

  user_data_base64 = base64encode(local.user_data)

  enable_volume_tags = false
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
      tags = {
        Name = "my-root-block"
      }
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
