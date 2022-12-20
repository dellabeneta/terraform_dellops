resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    "Name" = "dellops_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "dellops_subnet"
  }
}