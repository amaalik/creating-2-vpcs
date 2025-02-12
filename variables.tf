variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc1_cidr" {
  description = "CIDR block for VPC 1"
  default     = "10.0.0.0/16"
}

variable "vpc2_cidr" {
  description = "CIDR block for VPC 2"
  default     = "10.1.0.0/16"
}

variable "vpc1_subnet_cidr" {
  description = "Subnet CIDR block for VPC 1"
  default     = "10.0.1.0/24"
}

variable "vpc2_subnet_cidr" {
  description = "Subnet CIDR block for VPC 2"
  default     = "10.1.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-085ad6ae776d8f09c" 
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default = "malik"
}
