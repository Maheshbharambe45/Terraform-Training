variable "cidr_block_vpc" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "Terraform-Vpc"
}

variable "public_subnet" {
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.3.0/24" ]
}

variable "private_subnet" {
  type = list(string)
  default = [ "10.0.5.0/24", "10.0.7.0/24" ]
}

variable "igw_name" {
  type = string
  default = "terraform-igw"
}