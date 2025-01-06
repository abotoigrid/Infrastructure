output "vm_public_ip" {
  value = module.vm.public_ip
}

output "db_endpoint" {
  value = module.database.db_endpoint
}

output "load_balancer_dns_name" {
  value = module.network.lb_dns_name
}