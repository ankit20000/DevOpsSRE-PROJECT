variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "az" {
  type = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
} 

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "rt_cidr" {
  type = string
  description = "Route public traffic"
  default = "0.0.0.0/0"
}

variable "allow_all" {
  type = string
  description = "It will allow all public traffic"
  default = "0.0.0.0/0"
}

variable "ingress" {
  type = list
  description = "inbound rule for server"
  default = [22,80,443]
}

variable "engress" {
  type = list
  description = "outbound rule for server"
  default = [22,80,443,555]
}

variable "ami" {
  type = string
  default = "ami-0f5ee92e2d63afc18"
}
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "This is EC2 instance type"
}

variable "key" {
  type        = string
  default     = "pem_file"
  description = "This is pem file"

}