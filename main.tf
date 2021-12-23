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

module "ecr" {
  source = "./ecr"
}
module "main-vpc" {
  source = "./vpc"
}

module "instances" {
  source             = "./instances"
  VPC_ID             = module.main-vpc.main-vpc-id
  PUBLIC_SUBNET_1_ID = module.main-vpc.public-subnet-1-id
  PUBLIC_SUBNET_2_ID = module.main-vpc.public-subnet-2-id
  PATH_TO_PUBLIC_KEY = "./keys/mykey.pub"
  PATH_TO_USER_DATA  = "./scripts/bootstrap.sh"
}

# module "rds" {
#   source              = "./rds"
#   VPC_ID              = module.main-vpc.main-vpc-id
#   PRIVATE_SUBNET_1_ID = module.main-vpc.private-subnet-1-id
#   PRIVATE_SUBNET_2_ID = module.main-vpc.private-subnet-2-id
#   ALLOWED_SG          = module.instances.web-instance-sg-ids
#   PREFERED_AZ         = module.main-vpc.private-subnet-az
# }
