# variable "create_private_subnets" {
#   description = "If true create a private subnet for each availability zone including a NAT gateway."
#   default     = "true"
# }

# variable "create_private_hosted_zone" {
#   description = "If true a privated hosted zone is created."
#   default     = "true"
# }

# variable "public_subnet_map_public_ip_on_launch" {
#   description = "Set the default behavior for instances created in the VPC. If true by default a publi ip will be assigned."
#   default     = "false"
# }

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ami" {
  default = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "desktop-key"
}

variable "subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "allow_all" {
  default = "0.0.0.0/0"
}

# variable "sg" {
#   type = map(list(string))
#   default = "aws_security_group.allow_all.id"

#   }
