## create 2 subnets using count

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


locals {
  project = "project-01"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2
  tags = {
    Name = "${local.project}-subnet-${count.index}" 
  }
}

#creating 4 ec2 instance
#part 2 -- two instance with different ami

resource "aws_instance" "main" {
  count = length(var.ec2_config)
  ami = var.ec2_config[count.index].ami
  instance_type = var.ec2_config[count.index].instance_type

  subnet_id = element(aws_subnet.main[*].id, count.index% length(aws_subnet.main))
  # count = 4
  # subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))

  tags = {
    Name = "${local.project}-instance-${count.index}" 
  }


}


output "aws_subnet_id" {
  value = aws_subnet.main[0].id
}

#4 ec2 instance in each subnet



 
