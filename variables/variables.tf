variable "ami_id" {
  description = "This is for ami id "
}   

# variable "instance_type" {
#   description = "This is instance type" #when value is not provided it will ask from the user
# }

variable "instance_type" {
  description = "This is instance type"
#   default = "t3.micro"
  type = string
  
  validation {
    condition = var.instance_type == "t3.micro" || var.instance_type == "t3.small"
    error_message = "instance must be t2.micro or t3.micro"
  }
}



