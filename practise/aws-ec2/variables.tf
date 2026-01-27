variable "instance_name" {
  default = "My-EC2-Instance"
  type    = string
}

variable "instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ami_id" {
  default = "ami-087d1c9a513324697"
  type    = string
}


output "instance_ip" {
  value = aws_instance.this.public_ip
}

output "instance_arn" {
  value = aws_instance.this.arn
}

