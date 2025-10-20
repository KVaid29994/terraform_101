
# 🌐 terraform-aws-vpc

## 📘 Overview

This Terraform module helps you **create an AWS VPC** with a custom CIDR block. It also provisions **multiple subnets** (public and private), and for public subnets, it sets up an **Internet Gateway (IGW)** and appropriate **route tables** for external connectivity.

## ✨ Features

- 🏗️ Creates a **VPC** with a specified CIDR block  
- 🌍 Provisions **public and private subnets**  
- 🚪 Sets up an **Internet Gateway (IGW)** for public subnets  
- 🗺️ Configures **route tables** for public subnets  

---

## usage

```
module "vpc_module" {
  source = "./module"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your-test-vpc"
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

