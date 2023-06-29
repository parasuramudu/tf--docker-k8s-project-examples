variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"  
}

variable "instance_tenancy" {
    type = string
    default = "default"
}

variable "dns_support" {
    type = bool
    default = true
  
}
variable "dns_hostnames" {
  type = bool
  default = true
}

variable "tags" {
  type = map(string)
  default = {
     Name = "timing-2"
     Terraform = "true"
     Environment = "DEV"
  }
}
variable "public_subnets" {
   default = {
    public-subnet-1 = {
      Name = "public-subnet-1"
      cidr_block = "10.0.1.0/24"
      az = "ap-south-1a"
    }
    public-subnet-2 = {
      Name = "public-subnet-2"
      cidr_block = "10.0.2.0/24"
      az = "ap-south-1b"
    }
    public-subnet-3 = {
      Name = "public-subnet-3"
      cidr_block = "10.0.3.0/24"
      az = "ap-south-1c"
    }

}
  
}

variable "postgres_port" {
  type = number
  default = 5432
}
variable "cidr_list" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "instance_names" {
  type = list
  default = ["web-server","api-server"]
}

variable "isProd" {

  type = bool
  default = true
  
}
variable "env" {
  type = string
  default = "DEV"
}