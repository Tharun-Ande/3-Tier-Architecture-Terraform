output "ALB" {
    value = aws_lb.ALB.id
}

output "ALB_TG_arn" {
    value = aws_lb_target_group.ALB_TG.arn
}
