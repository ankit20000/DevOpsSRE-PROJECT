# creating security groups

resource "aws_security_group" "Security_groups" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc_custom.id

   dynamic "ingress" {
   for_each=var.allow_security_groups
   
   content{
    from_port        = tonumber(ingress.value)
    to_port          = tonumber(ingress.value)
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.cidr_block]
  }

  tags = {
    Name = "allow_security_groups"
  }
}
