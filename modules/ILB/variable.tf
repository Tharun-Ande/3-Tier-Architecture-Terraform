variable "ILB_name" {
    type = string
}

variable "load_balancer_type" {
    type = string
}

variable "ILB_internal" {
    type = bool
}

variable "pvt_subnets" {
    type = list(string)
}

variable "ILB_SG" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "ILB_TG_name" {
    type = string
}

variable "ILB_port" {
    type = number
}

variable "ILB_protocol" {
    type = string
}

variable "ILB_target_type" {
    type = string
}

variable "ILB_path" {
    type = string
}

variable "ILB_action_type" {
    type = string
}