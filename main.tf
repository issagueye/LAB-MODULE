provider "aws" {
  region = "us-east-1"
}

module "my_ec2_instance" {
  source = "./module_ec2/"
  instance_type = var.instance_type
}
