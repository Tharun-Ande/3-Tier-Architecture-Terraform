variable "ALB_name" {
    type = string
}

variable "ALB_internal" {
    type = bool
}

variable "ALB_load_balancer_type" {
    type = string
}

variable "pub_subnets" {
    type = list(string)
}

variable "ALB_SG" {
    type = string
}

variable "ALB_TG_name" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "ALB_TG_port" {
    type = number 
}

variable "ALB_TG_protocol" {
    type = string
}

variable "ALB_TG_target_type" {
    type = string
}

variable "ALB_TG_path" {
    type = string
}

variable "ALB_action_type" {
    type = string
}