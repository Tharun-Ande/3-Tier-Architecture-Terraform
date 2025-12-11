output "ILB" {
    value = aws_lb.ILB.id
}

output "ILB_TG_arn" {
    value = aws_lb_target_group.ILB_TG.id
}