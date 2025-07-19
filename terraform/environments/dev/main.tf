provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "../../modules/vpc"
  name            = var.name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  azs             = var.azs
}


module "alb" {
  source     = "../../modules/alb"
  name       = var.name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "iam" {
  source = "../../modules/iam"
  name   = var.name
}

module "ecr" {
  source = "../../modules/ecr"
  name   = var.name
}



module "ecs" {
  source              = "../../modules/ecs"
  name                = var.name
  container_image     = "${module.ecr.repository_url}:latest"
  subnet_ids          = module.vpc.public_subnet_ids
  security_group_id   = module.alb.alb_security_group_id
  target_group_arn    = module.alb.target_group_arn
  execution_role_arn  = module.iam.execution_role_arn
  task_role_arn       = module.iam.execution_role_arn
}
