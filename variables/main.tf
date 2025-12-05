resource "aws_instance" "my_instance" {
  ami = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "data-source-instance"
  }
}   