# AWS provider Configurations
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "heyyy-maheshhhh"
    key = "backend.tfstate"
    region = "ap-south-1"
  }
}

