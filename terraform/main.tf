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
