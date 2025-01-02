resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.ec2_key_name
  tags                   = var.tags
}


resource "aws_eip" "eip" {
  instance = aws_instance.app_server.id
  tags     = var.tags
}