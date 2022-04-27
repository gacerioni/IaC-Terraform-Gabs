provider "aws" {
  region = "sa-east-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.tags
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl
}

resource "aws_instance" "harness-server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
