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

resource "aws_vpc" "practiceVPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name = "kvVPC"
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.practiceVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
    Name = "publicsubnet"
  }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.practiceVPC.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
    Name = "privatesubnet"
  }
}

resource "aws_internet_gateway" "kvIGW" {
    vpc_id = aws_vpc.practiceVPC.id

    tags = {
    Name = "practice"
  }
}

# Public Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.practiceVPC.id

    tags = {
    Name = "public-rt"
  }

}

# Route to Internet Gateway
resource "aws_route" "public_internet_access" {
    route_table_id =  aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.kvIGW.id
}


# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}