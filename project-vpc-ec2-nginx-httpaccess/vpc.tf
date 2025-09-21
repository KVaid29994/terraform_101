resource "aws_vpc" "kv_proj_vpc" {
cidr_block = "10.0.0.0/16"
instance_tenancy = "default"

tags = {
  Name = "project1"
}
}

# ------------------------
# Subnets
# ------------------------

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.kv_proj_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.kv_proj_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet"
  }
}

# ------------------------
# Internet Gateway
# ------------------------
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kv_proj_vpc.id

  tags = {
    Name = "igw"
  }
}

# ------------------------
# Route Table (Public)
# ------------------------

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.kv_proj_vpc.id

   tags = {
    Name = "pub-rt"
  }
}

resource "aws_route" "public_internet_access" {
    route_table_id =  aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.kvIGW.id
}


# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.pub_rt.id
}

