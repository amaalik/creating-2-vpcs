output "vpc_1_id" {
  description = "VPC 1 ID"
  value       = aws_vpc.vpc_1.id
}

output "vpc_2_id" {
  description = "VPC 2 ID"
  value       = aws_vpc.vpc_2.id
}

output "ec2_vpc1_public_ip" {
  description = "Public IP of EC2 instance in VPC 1"
  value       = aws_instance.ec2_vpc1.public_ip
}

output "ec2_vpc2_public_ip" {
  description = "Public IP of EC2 instance in VPC 2"
  value       = aws_instance.ec2_vpc2.public_ip
}
