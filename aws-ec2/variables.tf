variable "instance_type" {
  type = string
  description = "These is instance type"
  default = "t3.micro"
}

variable "ami_id" {
  type = string
  description = "These is AMI"
  default = "ami-02b8269d5e85954ef"
}
