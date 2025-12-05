resource "aws_instance" "my-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "Minikube-key"
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  user_data = <<-EOF
        #!/bin/bash
        sudo apt install nginx -y
        sudo systemctl start nginx
        EOF
        
  tags = {
    Name = "my-instance"
  }
}