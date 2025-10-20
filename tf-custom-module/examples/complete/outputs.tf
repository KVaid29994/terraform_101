output "vpc" {
  value = module.vpc_module.vpc_id
}

output "public_subnet" {
  value = module.vpc_module.public_subnets
}

output "private_subnet" {
  value = module.vpc_module.private_subnets
}