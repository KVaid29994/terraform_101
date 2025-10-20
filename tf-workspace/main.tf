terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
 region = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket_s3" {
  bucket = "practice-bucket-kashish"
}

resource "aws_s3_object" "practice_object_upload" {
    bucket = aws_s3_bucket.demo_bucket_s3.bucket
    source = "./practice_file.txt"
    key = "my_data.txt"

}