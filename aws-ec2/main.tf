resource "aws_instance" "my-instance" {
    ami = "ami-00af95fa354fdb788"
    instance_type = "c7i-flex.large"

    tags = {
      Name = "DemoServer"
    }
}
