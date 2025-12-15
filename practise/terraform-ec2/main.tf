data "aws_vpc" "vpc" {
    default = true
}

resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "Minikube-key"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = var.instnce_name 
  }
}

resource "aws_security_group" "this" {
  vpc_id = data.aws_vpc.vpc.id
  description = "these is temporary security group"

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

    ingress {
    from_port = 443
    to_port = 443
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