output "db_subnet_group" {
    value = aws_db_subnet_group.db_subnet_group.id
}

output "rds_arn" {
    value = aws_db_instance.rds.arn
}