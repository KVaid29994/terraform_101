terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.0"
    }
  }
  backend "s3" {
    bucket = "name-of-bucket"
    key = "backend.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "kvpracticeserver" {
  ami = "ami-0e3c2921641a4a215"
  instance_type = "t3.nano"
  tags =  {
    Name = "SampleServer"
  }
}



