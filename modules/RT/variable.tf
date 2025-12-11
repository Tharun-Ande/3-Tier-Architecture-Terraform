variable "vpc_id" {
    type = string
}

variable "rt_cidr" {
    type = string
}

variable "igw_id" {
    type = string
}

variable "pub_rt_name" {
    type = string
}

variable "pub_subnets" {
    type = list(string)
}

variable "nat_id" {
    type = string
}

variable "pvt_rt_name" {
    type = string
}

variable "pvt_subnets" {
    type = list(string)
}