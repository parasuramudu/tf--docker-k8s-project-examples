variable "cidr_vpc" {
  default = "10.0.0.0/16"
  # this variable valied for timing infra
}

variable "common_tags" {
  type = map(any)
  default = {
    Name        = "timing"
    Terraform   = "true"
    Environment = "Dev"
  }

}
variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}
variable "public_subnet_names" {
    default = ["timing-public-1a","timing-public-1b"]
  
}
variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]

}
variable "private_subnet_names" {
    default = ["timing-private-1a","timing-private-1b"]
  
}
