module "network" {
  source            = "./modules/network"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  tags              = var.tags
}

module "vm" {
  source            = "./modules/vm"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
  instance_key_name = var.instance_key_name
  tags              = var.tags
}

module "database" {
  source      = "./modules/database"
  subnet_id   = module.network.subnet_id
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  tags        = var.tags
}