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

  CLUSTER_ID       = module.ecs.CLUSTER_ID
  VPC_ID           = module.vpc.VPC_ID
  ALB_SG_ID        = module.security.ALB_SG_ID
  PUBLIC_SUBNET_1A = module.vpc.PUBLIC_SUBNET_1A
  PUBLIC_SUBNET_1B = module.vpc.PUBLIC_SUBNET_1B
  PUBLIC_SUBNET_1C = module.vpc.PUBLIC_SUBNET_1C
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "ecs" {
  source = "./modules/ecs"

  ECS_SG_ID              = module.security.ECS_SG_ID
  ECS_TASK_EXEC_ROLE_ARN = module.iam.ECS_TASK_EXEC_ROLE_ARN
  ALB_LISTENER           = module.alb.ALB_LISTENER
  TARGET_GROUP_ARN       = module.alb.TARGET_GROUP_ARN
  PUBLIC_SUBNET_1A       = module.vpc.PUBLIC_SUBNET_1A
  PUBLIC_SUBNET_1B       = module.vpc.PUBLIC_SUBNET_1B
  PUBLIC_SUBNET_1C       = module.vpc.PUBLIC_SUBNET_1C
  PRIVATE_SUBNET_1A      = module.vpc.PRIVATE_SUBNET_1A
  PRIVATE_SUBNET_1B      = module.vpc.PRIVATE_SUBNET_1B
  PRIVATE_SUBNET_1C      = module.vpc.PRIVATE_SUBNET_1C
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
