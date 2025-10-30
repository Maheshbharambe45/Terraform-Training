output "instance_public_ip" {
  value = aws_instance.my-instance.public_ip
  description = "This is for public ip of the instance"
}

output "ami_id" {
  value = aws_instance.my-instance.ami
  description = "It will show you the ami id of the instance"
}