resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.ec2_key_name
  tags                   = var.tags
  iam_instance_profile = var.iam_instance_profile_name
}


resource "aws_eip" "eip" {
  instance = aws_instance.app_server.id
  tags     = var.tags
}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.app_server.id
  port             = 8080
}

locals {
  dashboard_body = templatefile("${path.module}/dashboard.json.tpl", {
    instance_id         = aws_instance.app_server.id
    instance_private_ip = aws_instance.app_server.private_ip
  })
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "AppServerDashboard"
  dashboard_body = local.dashboard_body
}