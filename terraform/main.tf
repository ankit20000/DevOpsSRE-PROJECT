#creating EC2 Instance

resource "aws_instance" "example"{
  ami           = var.ami_type
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnets.id 
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  key_name = var.key_name
  associate_public_ip_address = true

   tags = {
    Name = "terraform-example"
  }
}

#creating VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "VPC_TF"
  }
}
# Creating Public & Private Subnets
resource "aws_subnet" "public_subnets" {
 vpc_id     = aws_vpc.main.id
 cidr_block = var.public_subnet_cidrs
 #availability_zone = var.az
 
 tags = {
   Name = "Public Subnet"
 }
}
 
resource "aws_subnet" "private_subnets" {
 vpc_id     = aws_vpc.main.id
 cidr_block = var.private_subnet_cidrs
 #availability_zone =  var.az
 tags = {
   Name = "Private Subnet"
 }
}
#Creating Internet gateway
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Terraform_IGWs"
 }
}
#creating route table 
resource "aws_route_table" "rt_cidr" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = var.rt_cidr
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "Route Table"
 }
}
#Route table association
resource "aws_route_table_association" "Public_AS" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.rt_cidr.id
}

#Security group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.rt_cidr]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow_tls"
  }
}