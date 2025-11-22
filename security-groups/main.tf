provider "aws" {
    profile  = "default"
    region   = "us-east-1"
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = var.vpc-filter-tag
}
}

resource "aws_security_group" "sg" {
    #count = var.security_groups ? 1 : 0

  name        = var.name
  #description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.vpc.id

  dynamic "ingress" {
    iterator =port
    for_each =var.ingressrules
      content { 
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
     # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
      }
    }
  

  dynamic "egress" {
    iterator =port
    for_each =var.egressrules
      content { 
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
      }  
  }
}