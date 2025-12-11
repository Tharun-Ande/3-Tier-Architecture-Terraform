# vpc variables

variable "vpc_cidr_block" {
    type = string
}

variable "vpc_instance_tenancy" {
    type = string
}

variable "vpc_name" {
    type = string
}

# subnet variables

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

# igw variables 

variable "igw_name" {
    type = string
}

# eip variables 

variable "eip_name" {
    type = string
}

# NAT variables

variable "NAT_name" {
    type = string
}


# Route Table variables

variable "rt_cidr" {
    type = string
}

variable "pub_rt_name" {
    type = string
}

variable "pvt_rt_name" {
    type = string
}


# SG variables

variable "ALB_sg_name" {
    type = string
}

variable "Frontend_sg_name" {
    type = string
}

variable "ILB_sg_name" {
    type = string
}

variable "Backend_sg_name" {
    type = string
}

variable "DB_sg_name" {
    type = string
}

# Key Pair Variables

variable "key_pair_name" {
    type = string
}

variable "public_key" {
    type = string
}

# ALB values

variable "ALB_name" {
    type = string
}

variable "ALB_internal" {
    type = bool
}

variable "ALB_load_balancer_type" {
    type = string
}

variable "ALB_TG_name" {
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


# ILB values

variable "ILB_name" {
    type = string
}

variable "load_balancer_type" {
    type = string
}

variable "ILB_internal" {
    type = bool
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

# LT values

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

variable "LT_resource_type" {
    type = string
}

variable "Frontend_ec2_name" {
    type = string
}

variable "Backend_LT_name" {
    type = string
}

variable "Backend_ec2_name" {
    type = string
}

# ASG variables

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

variable "health_check_type" {
    type = string
}

variable "ASG_version" {
    type = string
}

variable "Backend_ASG_name" {
    type = string
}


# RDS variables 

variable "db_subnet_group_name" {
    type = string
}

variable "rds_identifier" {
    type = string
}

variable "rds_allocated_storage" {
    type = number
}

variable "rds_engine" {
    type = string
}

variable "rds_engine_version" {
    type = string
}

variable "rds_instance_class" {
    type = string
}

variable "username" {
    type = string
}

variable "password" {
    type = string
}

variable "db_name" {
    type = string
}

variable "rds_skip_final_snapshot" {
    type = bool
}

variable "rds_multi_az" {
    type = bool
}

variable "rds_storage_type" {
    type = string
}

variable "rds_publicly_accessible" {
    type = bool
}