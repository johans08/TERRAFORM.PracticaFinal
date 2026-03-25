module "network" {
  source      = "./network"
  vpc_cidr    = lookup(var.vpc_cidr, terraform.workspace)
  subnet_cidr = lookup(var.subnet_cidr, terraform.workspace)
  tags        = var.tags
}

module "security" {
  source = "./security"
  vpc_id = module.network.vpc_id
  tags   = var.tags
}

module "infra" {
  source             = "./infra"
  ami                = lookup(var.ami, terraform.workspace)
  instancia          = lookup(var.instancia, terraform.workspace)
  subnet_id          = module.network.subnet_id
  tags               = var.tags
  security_group_ids = [module.security.security_group_id]
}