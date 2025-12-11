variable "Frontend_ASG_name" {
    type = string
}

variable "min_size" {
    type = number
}

variable "max_size" {
    type = number
}

variable "desired_capacity" {
    type = number
}

variable "pub_subnets" {
    type = list(string)
}

variable "health_check_type" {
    type = string
}

variable "Frontend_TG_arn" {
    type = string
}

variable "Frontend_LT_id" {
    type = string
}

variable "ASG_version" {
    type = string
}

variable "Backend_ASG_name" {
    type = string
}

variable "Backend_TG_arn" {
    type = string
}

variable "pvt_subnets" {
    type = list(string)
}

variable "Backend_LT_id" {
    type = string
}