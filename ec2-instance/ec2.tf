resource "aws_instance" "dockerhost"{

     ami = "ami-012b9156f755804f5"
     instance_type = "t2.micro"

     tags = {
    Name = "jenkins"
  }
}