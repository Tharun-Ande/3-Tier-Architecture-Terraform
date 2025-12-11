resource "aws_db_subnet_group" "db_subnet_group" {
    name = var.db_subnet_group_name
    subnet_ids = var.pvt_db_subnets
}

resource "aws_db_instance" "rds" {
    identifier = var.rds_identifier
    allocated_storage = var.rds_allocated_storage
    engine = var.rds_engine
    engine_version = var.rds_engine_version
    instance_class = var.rds_instance_class
    publicly_accessible = var.rds_publicly_accessible
    username = var.username
    password = var.password
    db_name = var.db_name
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    vpc_security_group_ids = [var.rds_sg]
    skip_final_snapshot = var.rds_skip_final_snapshot
    multi_az = var.rds_multi_az
    storage_type = var.rds_storage_type
}