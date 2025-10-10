resource "aws_key_pair" "deployer" {
  key_name   = "terra-ec2"
  public_key = file("terra-ec2.pub")
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_security" {
  name        = "automate-sg"
  description = "Allow SSH access"
  vpc_id      = aws_default_vpc.default.id    #interpolation

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "automate-sg"
  }
}

data "aws_ssm_parameter" "ubuntu_22_04" {
  name   = "/aws/service/canonical/ubuntu/server/jammy/stable/current/amd64/hvm/ebs-gp2/ami-id"
  region = "ap-south-1"
}

resource "aws_instance" "myinstance" {
  ami                    = data.aws_ssm_parameter.ubuntu_22_04.value
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.my_security.id]

  root_block_device {
    volume_size = 10           # Size in GB B)
    volume_type = "gp2"        # Can be gp3, gp2, io1, etc.
    delete_on_termination = true
  }

  tags = {
    Name = "ubuntu-free"
  }
}


#  ssh -i terra-ec2 ubuntu@ec2-13-235-8-168.ap-south-1.compute.amazonaws.com  --- To connect