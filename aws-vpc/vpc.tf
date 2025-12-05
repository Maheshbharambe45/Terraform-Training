resource "aws_vpc" "this" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.this.id
  count = length(var.public_subnet)
  cidr_block = element(var.public_subnet , count.index)
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.this.id
  count = length(var.private_subnet)
  cidr_block = element(var.private_subnet, count.index)
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    gateway_id = aws_internet_gateway.this.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "this" {
  count = length(aws_subnet.public_subnet)
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.this.id
}