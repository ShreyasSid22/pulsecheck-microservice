# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "pulsecheck" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# -------------------------
# Public Subnet 1
# -------------------------
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.pulsecheck.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-1"
  }
}

# -------------------------
# Public Subnet 2
# -------------------------
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.pulsecheck.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-2"
  }
}

# -------------------------
# Internet Gateway
# -------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.pulsecheck.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# -------------------------
# Route Table
# -------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.pulsecheck.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# -------------------------
# Route Table Associations
# -------------------------
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}
