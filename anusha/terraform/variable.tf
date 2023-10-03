variable "vpc-name" {
  description = "vpc name"
  type        = string
  default  ="test"
}
variable "vpc-cidr" {
  description = "vpc cidr"
  type        = string
  default  ="10.0.0.0/24"
}