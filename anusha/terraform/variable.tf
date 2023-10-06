variable "vpc-name" {
  description = "vpc name"
  type        = string
  default  ="test"
}
variable "vpc-cidr" {
  description = "vpc cidr"
  type        = string
  default  ="10.0.0.0/16"
}
variable "igw_name" {
   default  ="test igw"
}
variable "subnet_cidr" {
   default  ="10.0.0.0/24"
}
variable "public_subnet_name" {
   default  ="public subnet"
}
variable "rt_cidr" {
   default  ="0.0.0.0/0"
}
variable "rt_name" {
   default  ="public route table"
}
variable "ami" {
   default  ="ami-067d1e60475437da2"
}
variable "instance_type" {
   default  ="t2.micro"
}
variable "key_name" {
   default  ="demo1"
}
variable "instance_name" {
   default  ="application"
}
variable "ingress" {
   default  =[22,80,443]
}
variable "egress" {
   default  =[22,80]
}
variable "allow_all" {
  default = "0.0.0.0/0"
}