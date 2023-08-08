variable "ec2_type" {
  type        = string
  default     = "t3.micro"
  description = "ec2-type"
}

variable "ami_type"{
    type        = string
    default     =  "ami-0f5ee92e2d63afc18"
    description = "ami_type"
}

variable "key_name"{
    type        = string
    default     =  "Sample"
    description = "key_name"
}

variable "private_ip"{
    type        = string
    default     =  "10.0.0.16"
    description = "private_ip"
}

variable "allow_security_groups" {
  description = "Input list"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "cidr_block" {
  description = "cidr_block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "availability_zones" {
  description = "availability_zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "specific_cidr_blocks" {
  description = "specific_cidr_blocks"
  type        = list(string)
  default     = ["10.0.0.0/26", "10.0.0.64/26", "10.0.0.0/22"]
}

variable "region" {
  description = "region"
  type        = string
  default     = "ap-south-1"
}

variable "ebs_size" {
  description = "region"
  type        = string
  default     = "10"
}

variable "boolean_values" {
  description ="boolean_values"
  type        = list(string)
  default     = ["true", "false"]
}

