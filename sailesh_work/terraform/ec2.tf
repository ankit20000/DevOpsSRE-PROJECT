# resource "aws_instance" "webserver" {
#   ami                         = "ami-0f5ee92e2d63afc18"
#   instance_type               = "t2.micro"
#   key_name                    = "desktop-key"
#   associate_public_ip_address = true
#   tags = {
#     Name = "Server-1"
#   }
# }

# resource "aws_instance" "webserver" {
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   key_name                    = "desktop-key"
#   associate_public_ip_address = true
#   tags = {
#     Name = "Server-1"
#   }
# }

# resource "aws_instance" "server-1" {
#   ami = var.ami
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.subnet1-public.id
#   vpc_security_group_ids      = [aws_security_group.allow_all.id]
#   associate_public_ip_address = true
#   tags = {
#     Name       = "server-1"
#   }
# }

