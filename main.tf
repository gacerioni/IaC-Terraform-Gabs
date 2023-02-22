provider "aws" {
  region = var.region
  access_key = var.global_access_key
  secret_key = var.global_secret_key
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.tags
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl
}
