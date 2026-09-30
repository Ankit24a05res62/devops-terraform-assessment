provider "aws" {
  region = var.aws_region
}

module "network" {
  source      = "../../modules/network"
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "ecs" {
  source             = "../../modules/ecs"
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  alb_sg_id          = module.network.alb_sg_id
  ecs_sg_id          = module.network.ecs_sg_id
}

module "rds" {
  source                  = "../../modules/rds"
  environment             = var.environment
  private_subnet_ids      = module.network.private_subnet_ids
  rds_sg_id               = module.network.rds_sg_id
  db_instance_class       = var.db_instance_class
  backup_retention_period = var.backup_retention_period
  deletion_protection     = var.deletion_protection
}