resource "aws_subnet" "pub" {
    vpc_id = var.vpc_id
    count = length(var.pub_sub_cidr)
    cidr_block = var.pub_sub_cidr[count.index]
    availability_zone = var.pub_azs[count.index]
    map_public_ip_on_launch = var.map_public_ip_on_launch

    tags = {
      Name = var.pub_sub_names[count.index]
    }
}

resource "aws_subnet" "pvt" {
    vpc_id = var.vpc_id
    count = length(var.pvt_sub_cidr)
    cidr_block = var.pvt_sub_cidr[count.index]
    availability_zone = var.pvt_azs[count.index]

    tags = {
        Name = var.pvt_sub_names[count.index]
    }
}

resource "aws_subnet" "pvt_DB" {
    vpc_id = var.vpc_id
    count = length(var.pvt_DB_sub_cidr)
    cidr_block = var.pvt_DB_sub_cidr[count.index]
    availability_zone = var.pvt_DB_azs[count.index]

    tags = {
        Name = var.pvt_DB_sub_names[count.index]
    }
}