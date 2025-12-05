variable "ami_id" {
  type = string
  default = "ami-087d1c9a513324697"
  description = "this is ami id for aws instance"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "this is instance type"
}

variable "sg_name" {
  type = string
  default = "my-security-group"
}

