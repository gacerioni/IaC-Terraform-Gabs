provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "harness-server" {
  ami           = "ami-830c94e3"
  instance_type = var.instancetype

  tags = var.tags
}
