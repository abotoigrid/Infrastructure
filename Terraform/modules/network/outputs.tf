output "subnet_id_a" {
  value = aws_subnet.main_a.id
}

output "subnet_id_b" {
  value = aws_subnet.main_b.id
}

output "security_group_id" {
  value = aws_security_group.allow_http_ssh.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "lb_dns_name" {
  value = aws_lb.main.dns_name
}

output "lb_target_group_arn" {
  value = aws_lb_target_group.main.arn
}