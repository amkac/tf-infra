terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "akac"

    workspaces {
      name = "products-infra"
    }
  }
}

module "main-vpc" {
  source = "./vpc"
}

module "instances" {
  source             = "./instances"
  VPC_ID             = module.main-vpc.main-vpc-id
  PUBLIC_SUBNET_ID   = module.main-vpc.public-subnet-id
  PATH_TO_PUBLIC_KEY = "./keys/mykey.pub"
}

module "rds" {
  source            = "./rds"
  VPC_ID            = module.main-vpc.main-vpc-id
  PRIVATE_SUBNET_ID = module.main-vpc.private-subnet-id
  ALLOWED_SG        = module.instances.web-instance-sg-ids
  PREFERED_AZ       = module.main-vpc.private-subnet-az
}
