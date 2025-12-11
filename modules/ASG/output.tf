output "Frontend_ASG" {
    value = aws_autoscaling_group.Frontend_ASG.id
}

output "Backend_ASG" {
    value = aws_autoscaling_group.Backend_ASG.id
}