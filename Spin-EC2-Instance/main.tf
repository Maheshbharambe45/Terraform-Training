resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("terra-key-ec2.pub") 
}


resource "aws_default_vpc" "default" {}

resource "aws_security_group" "demo" {
  name = "Demo-Group"
  description = "This is demo group"
  vpc_id = aws_default_vpc.default.id 

  tags = {
    Name = "Allow-Login"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All acess open"
  }
}

resource "aws_instance" "demo_server" {
  ami           = "ami-02d26659fd82cf299" 
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.demo.name]

 root_block_device {
   volume_size = 8
   volume_type = "gp3"
 }

  tags = {
    Name = "Demo-Server"
  }
}


