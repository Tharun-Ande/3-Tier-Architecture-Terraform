output "ALB_SG" {
    value = aws_security_group.ALB.id
}

output "Frontend_SG" {
    value = aws_security_group.Frontend.id
}

output "ILB_SG" {
    value = aws_security_group.ILB.id
}

output "Backend_SG" {
    value = aws_security_group.Backend.id
}

output "DB_SG" {
    value = aws_security_group.DB.id
}