provider "aws" {
  region = "sa-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket_prefix = var.bucket_prefix
  acl    = var.acl

tags = var.tags
}
