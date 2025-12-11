resource "aws_route_table" "pub_rt" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.rt_cidr
        gateway_id = var.igw_id 
    }

    tags = {
        Name = var.pub_rt_name
    }
}

resource "aws_route_table_association" "pub_association" {
    count = length(var.pub_subnets)
    subnet_id = var.pub_subnets[count.index]
    route_table_id = aws_route_table.pub_rt.id  
}

resource "aws_route_table" "pvt_rt" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.rt_cidr
        gateway_id = var.nat_id
    }

    tags = {
        Name = var.pvt_rt_name
    }  
}

resource "aws_route_table_association" "pvt_associaton" {
    count = length(var.pvt_subnets)
    subnet_id = var.pvt_subnets[count.index]
    route_table_id =  aws_route_table.pvt_rt.id
}