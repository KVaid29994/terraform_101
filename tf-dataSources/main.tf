terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.0"
    }
  }
  }

provider "aws" {
 region = "us-east-1"
}
data "aws_ami" "name" {
  most_recent = true
  owners = [ "amazon" ]
}
output "aws_ami" {
    value = data.aws_ami.name.id
}

data "aws_security_group" "kash_sg" {
  tags = {
    mywebserver = "http"
  }
}

output "aws_security_group" {
    value = data.aws_security_group.kash_sg.id
  
}

#aws vpc_id

data "aws_vpc" "name1" {
    tags = {
      ENV = "prod"
    }
}

output "aws_vpc" {
  value = data.aws_vpc.name1.id
}

#avaialbly zone

data "aws_availability_zones" "names" {
  state = "available"
}

output "aws_zones" {
  value = data.aws_availability_zones.names
}

#get account detais

data "aws_caller_identity" "namekaun" {
}

output "caller" {
  value = data.aws_caller_identity.namekaun
}
resource "aws_instance" "kvpracticeserver" {
  ami = data.aws_ami.name.id
  instance_type = "t3.nano"
  tags =  {
    Name = "SampleServer"
  }
}

