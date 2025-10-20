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


resource "aws_s3_bucket" "main" {
    bucket = "myawsbucket-1234567"
  #terraform import aws_s3_bucket.main myawsbucket-1234567
  #check with terraform state list
}