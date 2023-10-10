module "module" {
  source = "git::https://github.com/ankit20000/DevOpsSRE-PROJECT.git?ref=sailesh_terraform_module"
  vpc_cidr      = var.vpc_cidr
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_cidr   = var.subnet_cidr
  allow_all     = var.allow_all
  rt_cidr       = var.rt_cidr
  az            = var.az
  server_name   = var.server_name
  egress        = var.egress
  ingress       = var.ingress
  region        = var.region

}