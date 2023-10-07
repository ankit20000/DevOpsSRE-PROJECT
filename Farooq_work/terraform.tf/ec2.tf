resource "aws_instance" "ec2_instance" {
  count        = length(var.cidr_public_subnet)
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key         
  subnet_id     = element(aws_subnet.pub_subnet[*].id, count.index)
  security_groups = [aws_security_group.tf_sg.id]
  associate_public_ip_address = true

 lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "pub_server -${count.index + 1}"
}
}