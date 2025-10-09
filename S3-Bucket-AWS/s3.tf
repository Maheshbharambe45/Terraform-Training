# AWS provider Configurations
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# create the s3 resource associated with aws
resource "aws_s3_bucket" "my_bucket" {
  bucket = "demo-bucket-9067"
}