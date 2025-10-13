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

resource "aws_instance" "myserver" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = var.aws_instance_type

    ## In Terraform, root_block_device defines the configuration of the root ## EBS volume attached to an EC2 instance, such as size, type, and whether ### it should be deleted on termination.

    root_block_device {
      delete_on_termination = true
      volume_size = var.ec2_config.v_size
      volume_type = var.ec2_config.v_type
    }

    tags = {
      Name = "SampleServerbyKV"
    }
  
}

