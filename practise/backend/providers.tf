terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0"
    }
  }

  backend "s3" {
    bucket = "heyyy-seriiii"
    key = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

