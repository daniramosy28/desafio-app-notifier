# PROVIDER
terraform {

  required_version = "~> 1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13"
    }
  }

  backend "s3" {
    bucket         = "tf-notifier-state-v1"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-notifier-state-v1"
    region         = "us-east-1"
    profile        = "fiap"
  }
}

#provider "aws" {
 #  region                   = "us-east-1"
 #  shared_config_files      = ["./.aws/config"]
 #  shared_credentials_files = ["./.aws/credentials"]
 #  profile                  = "fiap"
 #}

 module "provider_compute" {
  source  ="./modules/compute" 
  depends_on = [ backend ]
 }
 
  module "provider_database" {
  source  ="./modules/database" 
  depends_on = [ backend ]
 }

  module "provider_network" {
  source  ="./modules/network" 
  depends_on = [ backend ]
 }
