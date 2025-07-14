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
