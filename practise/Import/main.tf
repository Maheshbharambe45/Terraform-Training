resource "aws_instance" "this" {
  ami = "ami-087d1c9a513324697"
  instance_type = "t3.micro"

  tags = {
    Name = "Import-Managed",
    Author = "Mahesh_Bharambe"
  }
}