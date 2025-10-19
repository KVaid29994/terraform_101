module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.2"

  name = "single-instance"
  ami = "AM-EEASOMSODCMOSM"
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  key_name      = "kash"
  subnet_id = module.vpc.public_subnets[0]

  tags = {
    Name = "module project"
    Environment = "dev"
  }
}
