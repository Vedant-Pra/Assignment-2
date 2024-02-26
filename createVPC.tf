# Create a VPC with CIDR block and appropriate tags
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
enable_dns_support = true
    enable_dns_hostnames = true
tags = {
Name = "My VPC"
}
}
# Create an internet gateway and add appropriate tags
resource "aws_internet_gateway" "gw" {
vpc_id = aws_vpc.main.id
tags = {
Name = "Internet Gateway"
}
}
# Create a route table with a route to the internet gateway and tags
resource "aws_route_table" "public_route_table" {
vpc_id = aws_vpc.main.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.gw.id
}
tags = {
Name = "Public Route Table"
}
}
# Associate the public route table with the public subnet
# Create a security group with SSH access rules and tags
resource "aws_security_group" "ssh" {
name = "SSH"
vpc_id = aws_vpc.main.id
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"] # Restrict this for production environments
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "SSH Security Group"
}
}