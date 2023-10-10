resource "aws_instance" "private_server" {    
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_pair
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids      = [aws_security_group.SG_allow_all.id]
    associate_public_ip_address = true
    tags = {
        name = var.server
    }

}