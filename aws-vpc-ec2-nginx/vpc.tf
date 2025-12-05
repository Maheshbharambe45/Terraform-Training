resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MY-PRIVATE-NETWORK"
  }
}

#public subnet
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Pubilic-Subnet"
  }
}

#private subnet
resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-south-1b"
  tags = {
    Name = "private-Subnet"
  }
}

#internet gatway
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.vpc.id

    tags = {
    Name = "my-IGW"
    }
}

#route tables
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  tags = {
    Name = "my-public-rt"
  }
}

#route table association
resource "aws_route_table_association" "my_rt" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet.id
}
