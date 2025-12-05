# data "aws_vpc" "vpc" {
#   default = true
# }

data "aws_ami" "ami" {
  most_recent = true
  owners = ["amazon"]
}

data "aws_security_group" "sg" {
  tags = {
    Name = "my-sg"
  }
}

output "aws_ami" {
  value = data.aws_ami.ami.id
}

output "sg" {
  value = data.aws_security_group.sg.id
}

resource "aws_instance" "my_instance" {
  ami = data.aws_ami.ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  
  tags = {
    Name = "data-source-instance"
  }
}