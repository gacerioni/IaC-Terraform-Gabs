terraform {
  source = "git::git@github.com:gacerioni/IaC-Terraform-Gabs.git?ref=terragrunt-s3-creator"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "sa-east-1"
}
EOF
}
