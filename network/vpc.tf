resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    owner = var.tags.owner
    Name  = "VPC ${terraform.workspace}"
  }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    owner = var.tags.owner
    Name  = "Subnet ${terraform.workspace}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    owner = var.tags.owner
    Name  = "IGW ${terraform.workspace}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    owner = var.tags.owner
    Name  = "RT Public ${terraform.workspace}"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.public.id
}