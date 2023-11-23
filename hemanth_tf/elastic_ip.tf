resource "aws_eip" "custom_elastic_ip" {
  vpc = true


tags = {
    Name = "my_elastic_ip"
  }
}