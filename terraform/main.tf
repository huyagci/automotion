terraform {

  required_version = ">= 0.13"

  # This project is connected to a remote state on AWS S3.
  # There is a state-lock in effect by AWS DynamoDB to prevent conflicts with local changes and Gitlab CI/CD changes.
  backend "s3" {
    bucket         = "papp-tf-state-bucket"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      # Latest AWS provider version is used.
      version = ">= 4.22"
    }
  }
}

provider "aws" {
  region = var.AWS_SELECTED_REGION

  # Default tags will be applied to all resources.
  default_tags {
    tags = {
      CreatedBy   = "Terraform"
      Environment = "Production"
    }
  }
}

module "alb" {
  source = "./modules/alb"

  VPC_ID           = module.vpc.VPC_ID
  ALB_SG_ID        = module.vpc.ALB_SG_ID
  PUBLIC_SUBNET_1A = module.vpc.PUBLIC_SUBNET_1A
  PUBLIC_SUBNET_1B = module.vpc.PUBLIC_SUBNET_1B
  PUBLIC_SUBNET_1C = module.vpc.PUBLIC_SUBNET_1C
}

module "autoscaling" {
  source = "./modules/autoscaling"

  ECS_CLUSTER_NAME               = module.ecs.ECS_CLUSTER_NAME
  ECS_SERVICE_NAME               = module.ecs.ECS_SERVICE_NAME
  ECS_APP_AUTO_SCALE_SL_ROLE_ARN = module.iam.ECS_APP_AUTO_SCALE_SL_ROLE_ARN
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  # Threshold settings for auto-scaling.
  HIGH_CPU_THRESHOLD = "50"
  LOW_CPU_THRESHOLD  = "20"

  # Enabling/disabling auto-scaling.
  ENABLE_AUTOSCALE_OUT = true
  ENABLE_AUTOSCALE_IN  = true

  AWS_SELECTED_REGION  = var.AWS_SELECTED_REGION
  ECS_CLUSTER_NAME     = module.ecs.ECS_CLUSTER_NAME
  ECS_SERVICE_NAME     = module.ecs.ECS_SERVICE_NAME
  SCALE_OUT_POLICY_ARN = module.autoscaling.SCALE_OUT_POLICY_ARN
  SCALE_IN_POLICY_ARN  = module.autoscaling.SCALE_IN_POLICY_ARN
}

# # Required only for the initial creation of remote backend state storage.
# module "dynamodb" {
#   source = "./modules/dynamodb"
# }

# # Required only for the initial creation of remote backend state lock.
# module "s3" {
#   source = "./modules/s3"
# }

# # Bootstrapping ECR Private Repository for Gitlab CI/CD.
# module "ecr" {
#   source = "./modules/ecr"
# }

module "ecs" {
  source = "./modules/ecs"

  ECS_TASK_EXEC_ROLE_ARN = module.iam.ECS_TASK_EXEC_ROLE_ARN
  ALB_LISTENER           = module.alb.ALB_LISTENER
  TARGET_GROUP_ARN       = module.alb.TARGET_GROUP_ARN
  ECS_SG_ID              = module.vpc.ECS_SG_ID
  PRIVATE_SUBNET_1A      = module.vpc.PRIVATE_SUBNET_1A
  PRIVATE_SUBNET_1B      = module.vpc.PRIVATE_SUBNET_1B
  PRIVATE_SUBNET_1C      = module.vpc.PRIVATE_SUBNET_1C
}

module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"

  AWS_SELECTED_REGION = var.AWS_SELECTED_REGION
}
