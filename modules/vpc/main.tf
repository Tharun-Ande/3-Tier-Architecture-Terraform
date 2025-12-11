resource "aws_vpc" "harshith" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.vpc_instance_tenancy

    tags = {
      Name = var.vpc_name
    }
  
}