terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0"
    }
  }
  backend "s3" {
    bucket = "heyyy-seriiii"
    key = "backend.tfstate"
    region = "ap-south-1"
  }
}
