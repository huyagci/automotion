terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_DEFAULT_REGION
}

module "alb" {
  source = "./modules/alb"

  VPC_ID           = module.vpc.VPC_ID
  ALB_SG_ID        = module.security.ALB_SG_ID
  PUBLIC_SUBNET_1A = module.vpc.PUBLIC_SUBNET_1A
  PUBLIC_SUBNET_1B = module.vpc.PUBLIC_SUBNET_1B
  PUBLIC_SUBNET_1C = module.vpc.PUBLIC_SUBNET_1C
}

module "iam" {
  source = "./modules/iam"
}

module "security" {
  source = "./modules/security"

  VPC_ID = module.vpc.VPC_ID
}

module "vpc" {
  source = "./modules/vpc"
}
