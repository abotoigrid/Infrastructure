module "network" {
  source              = "./modules/network"
  vpc_cidr_block      = var.vpc_cidr_block
  subnet_cidr_block_a = var.subnet_cidr_block_a
  subnet_cidr_block_b = var.subnet_cidr_block_b
  tags                = var.tags
}

module "vm" {
  source                    = "./modules/vm"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = module.network.subnet_id_a
  security_group_id         = module.network.security_group_id
  target_group_arn          = module.network.lb_target_group_arn
  iam_instance_profile_name = var.iam_instance_profile_name
  ec2_key_name              = var.ec2_key_name
  tags                      = var.tags
}

module "database" {
  source      = "./modules/database"
  subnet_id_a = module.network.subnet_id_a
  subnet_id_b = module.network.subnet_id_b
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  vpc_id      = module.network.vpc_id
  tags        = var.tags
}
