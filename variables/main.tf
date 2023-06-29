resource "aws_vpc" "main" {

         cidr_block = var.cidr_block
         instance_tenancy = var.instance_tenancy
         enable_dns_support = var.dns_support
         enable_dns_hostnames = var.dns_hostnames

         tags = var.tags
     }
resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name = each.value.Name
  } 
  
}

#security group for postgres RDS ,port 5432 
resource "aws_security_group" "allow_postgres" {
  name        = "allow_postgres"
  description = "Allow postgres inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.postgres_port
    to_port          = var.postgres_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_list
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.tags,{
      Name = "timing-RDS-SG"
    }
  )
}

#if you don't provide VPC this will be created inside default VPC
#AMI ids are different for defferet regions
# it is a loop that can run 1 time because count value one
resource "aws_instance" "web-server"{
    count = 1  
     ami = "ami-012b9156f755804f5"
     instance_type = "t2.micro"
    tags = {
    Name = var.instance_names[count.index]
   }
}

resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = file("C:\\Users\\koppa\\terraform.pub")
  
}
resource "aws_instance" "conditions"{
     key_name = aws_key_pair.terraform.key_name
     ami = "ami-012b9156f755804f5"
     instance_type = var.env == "PROD"? "t2.large" : "t2.micro"
}





