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
