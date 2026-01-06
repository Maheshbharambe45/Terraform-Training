data "aws_vpc" "this" {
  default = true
}

resource "aws_security_group" "this" {
  vpc_id = data.aws_vpc.this.id
  name = "aws-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name = "Minikube-key"

#   provisioner "remote-exec" {
#     inline = [ 
#         "sudo apt update",
#         "sudo apt install nginx -y"
#      ]
#   }

#   connection {
#     user = "ubuntu"
#     host = self.public_ip
#     type = "ssh"
#   }

  tags = {
    Name = var.instance_name
  }
}