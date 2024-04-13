provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "local" {
    path = "dev/vpc/terraform.tfstate"
  }
}
module "vpc" {
  source          = "../../../infrastructure-modules/vpc"
  env             = "dev"
  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = "1"
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}
