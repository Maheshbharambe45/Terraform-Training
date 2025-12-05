resource "aws_instance" "my-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "Minikube-key"
  tags = {
    Name = "my-instance"
  }
  vpc_security_group_ids = [aws_security_group.my-sg.id]
}