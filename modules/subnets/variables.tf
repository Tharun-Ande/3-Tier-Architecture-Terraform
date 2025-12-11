variable "vpc_id" {
    type = string
}

variable "pub_sub_cidr" {
    type = list(string)
}

variable "pub_azs" {
    type = list(string)
}

variable "pvt_azs" {
    type = list(string)
}

variable "map_public_ip_on_launch" {
    type = bool
}

variable "pub_sub_names" {
    type = list(string)
}

variable "pvt_sub_cidr" {
    type = list(string)
}

variable "pvt_sub_names" {
    type = list(string)
}

variable "pvt_DB_sub_names" {
    type = list(string)
}

variable "pvt_DB_sub_cidr" {
    type = list(string)
}

variable "pvt_DB_azs" {
    type = list(string)
}
