resource "aws_instance" "this" {
  ami = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  key_name = "Minikube-key"

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update",
        "sudo apt install nginx -y"
     ]
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
  }

  tags = {
    Name = "terraform-instance"
  }
}

