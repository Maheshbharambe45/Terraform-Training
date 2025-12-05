resource "aws_instance" "instance" {

  ami = var.ami_id
  instance_type = var.instance_type 
  key_name = "Minikube-key"

  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "MY_EC2"
  }
}


