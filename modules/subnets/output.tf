output "pub_sub_id" {
    value = aws_subnet.pub[*].id
}

output "pvt_sub_id" {
    value = aws_subnet.pvt[*].id
}

output "pvt_DB_sub_id" {
    value = aws_subnet.pvt_DB[*].id
}

