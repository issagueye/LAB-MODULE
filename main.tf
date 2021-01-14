#Remote Backend Configuration
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "BAOBABGROUP"

    workspaces {
      name = "LAB-MODULE"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}

module "my_ec2_instance" {
  source = "./module_ec2/"
  instance_type = var.instance_type
}
