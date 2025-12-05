resource "aws_instance" "this" {
  ami = "ami-087d1c9a513324697"
  instance_type = "m7i-flex.large"

  tags = {
    Name = "EKS-DEMO"
  }
}