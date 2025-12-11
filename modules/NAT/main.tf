resource "aws_nat_gateway" "NAT" {
    allocation_id = var.eip_id
    subnet_id = var.pub_sub

    tags = {
      Name = var.NAT_name
    }  
}