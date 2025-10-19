provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "name" {
  state = "available"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"
  
  azs = data.aws_availability_zones.name.names
  name = "practiceVPC"
  cidr = "10.0.0.0/16"

  public_subnets = [ "10.0.0.0/24" ]
  private_subnets = ["10.0.1.0/24"]

  tags = {
    name = "test_vpc_module"
  }
}



