terraform {
  backend "s3" {
    bucket         = "papp-tf-state-bucket"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-state-lock"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.AWS_SELECTED_REGION
}

module "alb" {
  source = "./modules/alb"

  VPC_ID           = module.vpc.VPC_ID
  ALB_SG_ID        = module.security.ALB_SG_ID
  PUBLIC_SUBNET_1A = module.vpc.PUBLIC_SUBNET_1A
  PUBLIC_SUBNET_1B = module.vpc.PUBLIC_SUBNET_1B
  PUBLIC_SUBNET_1C = module.vpc.PUBLIC_SUBNET_1C
}

# Initial creation of remote backend state storage and lock
# module "dynamodb" {
#   source = "./modules/dynamodb"
# }

# module "s3" {
#   source = "./modules/s3"
# }

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

  AWS_SELECTED_REGION = var.AWS_SELECTED_REGION
}
