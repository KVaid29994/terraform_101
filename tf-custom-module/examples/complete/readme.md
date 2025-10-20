USAGE:

```
provider "aws" {
  region = "us-east-1"
  
}

module "vpc_module" {
  source = "./module"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-test-vpc"
  }

  subnet_config = {
    public_subnet-1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1b"
      public = true
    }
    public_subnet-2 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
      public = true
    }


    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1c"
    }
  }
}



```