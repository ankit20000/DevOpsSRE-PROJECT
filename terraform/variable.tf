variable "cidr_block" {
  default = "10.0.0.0/16"  
}


variable "ami_type" {
  type = string
  default = "ami-099b3d23e336c2e83"
  description = "ami_type"  
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "instance_type"
  
}

variable "key_name" {
  type = string
  default = "aws_login"
  description = "key_name"
  
}

variable "az"{
  type = string
  default = "ap-south-1"
  description = "availability zone"
}

variable "public_subnet_cidrs"{
  type = string
  default = "10.0.0.0/17"
  description = "public_subnet"

}
variable "private_subnet_cidrs" {
  type = string
  default = "10.0.128.0/17"
  description = "private_subnet"
  
}

#variable "allow_all"{

#}
variable "rt_cidr"{
  type = string
  default = "0.0.0.0/0"
  description = "routetable"
}
#variable "server_name"{}
#variable "egress"{}
#variable "ingress"{}
#variable "region"{}