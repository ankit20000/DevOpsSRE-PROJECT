module "module" {
  source = "git::https://github.com/ankit20000/DevOpsSRE-PROJECT.git?ref=sailesh_terraform_module"
  #   source        = "./module"
  vpc_cidr      = "10.0.0.0/16"
  ami           = "ami-041feb57c611358bd"
  instance_type = "t2.micro"
  key_name      = "demo1"
  subnet_cidr   = "10.0.0.0/24"
  allow_all     = "0.0.0.0/0"
  rt_cidr       = "0.0.0.0/0"
  az            = "ap-south-1a"
  server_name   = "web"
  egress        = [22, 80]
  ingress       = [22, 8080, 80, 443, 555]
  region        = "ap-south-1"

}
