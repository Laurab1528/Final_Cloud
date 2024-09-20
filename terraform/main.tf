terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "mi-proyecto-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}

locals {
  environment = terraform.workspace
}

provider "aws" {
  region = var.region
}

module "load_balancer" {
  source               = "./modules/load_balancer"
  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = module.networking.public_subnet_ids
  private_subnet_ids   = module.networking.private_subnet_ids
  frontend_instance_id = module.compute.frontend_instance_id
  backend_instance_id  = module.compute.backend_instance_id
  lb_internal          = var.lb_internal
  backend_port         = var.backend_port
  frontend_port        = var.frontend_port
}

module "compute" {
  source             = "./modules/compute"
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  bastion_subnet_id  = module.networking.bastion_subnet_id
  bastion_sg_id      = module.networking.bastion_sg_id
  frontend_sg_id     = module.networking.frontend_sg_id
  backend_sg_id      = module.networking.backend_sg_id
  public_key         = var.public_key
  db_password        = var.db_password
  db_username        = var.db_username
  backend_dns = module.load_balancer.backend_url
  db_host = module.database.db_endpoint



}


module "database" {
  source               = "./modules/database"
  subnet_ids           = module.networking.private_subnet_ids
  vpc_id               = module.networking.vpc_id
  db_username          = var.db_username
  db_password          = var.db_password
  private_subnet_ids   = module.networking.private_subnet_ids
  db_sg_id             = module.networking.database_sg_id
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_port              = var.db_port
}




resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.yml"
  content = templatefile("${path.module}/template/inventory.tpl",
    {
      bastion_ip  = module.compute.bastion_public_ip,
      frontend_ip = module.compute.frontend_public_ip[0],
      backend_ip  = module.compute.backend_private_ip
    }
  )
}



module "networking" {
  source               = "./modules/networking"
  vpc_cidr             = var.vpc_cidr[terraform.workspace]
  public_subnet_cidrs  = var.public_subnet_cidrs[terraform.workspace]
  private_subnet_cidrs = var.private_subnet_cidrs[terraform.workspace]
  allowed_cidr_blocks  = var.allowed_cidr_blocks
  db_port              = var.db_port
}
