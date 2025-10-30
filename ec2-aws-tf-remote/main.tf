

resource "aws_instance" "my-instance" {
    ami = "ami-07f07a6e1060cd2a8"
    instance_type = "t3.micro"
}

output "instance-output" {
  value = aws_instance.my-instance.public_ip
}