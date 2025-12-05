resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My-vpc"
  }
}

#priavte subnet
resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Private-subnet"
  }
}

#public subnet
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.my_vpc.id
  

  tags = {
    Name = "Public-subnet"
  }
}

#Internet gatway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My-IGW"
  }
}

#routing table
resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.my_vpc.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
    tags = {
    Name = "My-route-table"
  }
}

#route table which subnet associate with
resource "aws_route_table_association" "my-rt" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_table.id
}

resource "aws_instance" "my-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = "Minikube-key"
  
  tags = {
    Name = "terraform-instance"
  }
}