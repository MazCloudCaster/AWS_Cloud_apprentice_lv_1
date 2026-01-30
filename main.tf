terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

#create vpc

resource "aws_vpc" "my_main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_main_vpc"
  }

}

/* 1. Fetch all available AZs in your current region
data "aws_availability_zones" "available" {
  state = "available" # Only lists zones that are currently up and running
}

# 2. Output the list so you can see it in your terminal
output "all_availability_zones" {
  value = data.aws_availability_zones.available.names
}
*/

resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.my_main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Public_subnet_1a"
  }

}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.my_main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "Private_subnet_1b"
  }

}

#create security group

resource "aws_security_group" "my_main_sg" {
  name        = "allow tls"
  description = "this is main sg listing inbound/outbound rules"
  vpc_id      = aws_vpc.my_main_vpc.id

}

#create inbound rules in sg HTTPS

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.my_main_sg.id
  cidr_ipv4         = aws_vpc.my_main_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# 2. Add inbound HTTP (Port 80)
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# 4. Add inbound SSH (Port 22)
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#create outbound rules in sg
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my_main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



