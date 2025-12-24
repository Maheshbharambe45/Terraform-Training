variable "ami_id" {
  type = string
  default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "instance_name" {
  type = string
   default ="Terraform-instance"
}

output "ec2_ip" {
  value = aws_instance.this.public_ip
}