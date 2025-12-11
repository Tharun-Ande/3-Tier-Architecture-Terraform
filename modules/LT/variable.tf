variable "Frontend_LT_name" {
    type = string
}

variable "LT_version" {
    type = bool
}

variable "ami_id" {
    type = string
}

variable "LT_instance_type" {
    type = string
}

variable "key_pair_name" {
    type = string 
}

variable "Frontend_LT_SG" {
    type = string
}

variable "LT_resource_type" {
    type = string
}

variable "Frontend_ec2_name" {
    type = string
}

variable "Backend_LT_name" {
    type = string
}

variable "Backend_LT_SG" {
    type = string
}

variable "Backend_ec2_name" {
    type = string
}