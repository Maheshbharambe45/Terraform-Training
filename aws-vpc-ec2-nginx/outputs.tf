output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "ec2" {
  value = aws_instance.my-instance.public_ip
}

