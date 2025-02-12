provider "aws" {
  region = var.aws_region
}

# VPC 1
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc1_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC-1"
  }
}

# VPC 2
resource "aws_vpc" "vpc_2" {
  cidr_block           = var.vpc2_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC-2"
  }
}

# Internet Gateway for VPC 1
resource "aws_internet_gateway" "igw_vpc1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "VPC-1-IGW"
  }
}

# Internet Gateway for VPC 2
resource "aws_internet_gateway" "igw_vpc2" {
  vpc_id = aws_vpc.vpc_2.id

  tags = {
    Name = "VPC-2-IGW"
  }
}

# Subnet for VPC 1
resource "aws_subnet" "subnet_vpc1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.vpc1_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-VPC-1"
  }
}

# Subnet for VPC 2
resource "aws_subnet" "subnet_vpc2" {
  vpc_id                  = aws_vpc.vpc_2.id
  cidr_block              = var.vpc2_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-VPC-2"
  }
}

# Security Group for VPC 1
resource "aws_security_group" "sg_vpc1" {
  vpc_id = aws_vpc.vpc_1.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-VPC-1"
  }
}

# Security Group for VPC 2
resource "aws_security_group" "sg_vpc2" {
  vpc_id = aws_vpc.vpc_2.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-VPC-2"
  }
}

# EC2 Instance in VPC 1
resource "aws_instance" "ec2_vpc1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_vpc1.id]
  subnet_id              = aws_subnet.subnet_vpc1.id

  tags = {
    Name = "EC2-VPC-1"
  }
}

# EC2 Instance in VPC 2
resource "aws_instance" "ec2_vpc2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_vpc2.id]
  subnet_id              = aws_subnet.subnet_vpc2.id

  tags = {
    Name = "EC2-VPC-2"
  }
}
