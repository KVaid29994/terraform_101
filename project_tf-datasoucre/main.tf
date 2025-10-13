# create an ec2 instance using:
#     - existing VPC
#     - exisitng Security Group
#     - private-subnet

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.15.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "name1" {
    tags = {
      ENV = "prod"
    }
}

data "aws_subnet" "name" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.name1.id]
    }  
    tags = {
        Name = "private-subnet"
    }
}

data "aws_security_group" "kash_sg" {
  tags = {
    mywebserver = "http"
  }
  }


data "aws_ami" "name" {
  most_recent = true
  owners = [ "amazon" ]
}
resource "aws_instance" "kvpracticeserver" {
  ami = data.aws_ami.name.id
  instance_type = "t3.nano"
  subnet_id = [data.aws_subnet.name.id]
  security_groups = [data.aws_security_group.kash_sg.id]
  tags =  {
    Name = "SampleServer"
  }
}