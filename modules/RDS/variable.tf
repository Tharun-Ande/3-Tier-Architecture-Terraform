variable "db_subnet_group_name" {
    type = string
}

variable "pvt_db_subnets" {
    type = list(string)
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

variable "rds_sg" {
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