data "aws_vpc" "vpc" {
  default = true
}
resource "aws_security_group" "sg" {
    vpc_id = data.aws_vpc.vpc.id
    name = "my-security"
    description = "This is private group"

    # ingress {
    #     from_port = 22
    #     to_port = 22
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    #  ingress {
    #     from_port = 80
    #     to_port = 80
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    dynamic "ingress" {
      for_each = [
        {from_port = 22 , to_port = 22 , protocol = "tcp" },
        {from_port = 80 , to_port = 80 , protocol = "tcp" }
      ]
      content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol

        cidr_blocks = ["0.0.0.0/0"]
      }
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
     
    tags = {
    name = "my-sg"
    }
}