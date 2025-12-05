resource "aws_instance" "instance" {
  ami = "ami-087d1c9a513324697"
  instance_type = "t3.micro"

  tags = {
    Name = "ansible-server"
  }
}

output "ip" {
  value = aws_instance.instance.public_ip
}