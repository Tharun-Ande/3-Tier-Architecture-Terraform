resource "aws_lb" "ALB" {
    name = var.ALB_name
    internal = var.ALB_internal
    load_balancer_type = var.ALB_load_balancer_type
    subnets = var.pub_subnets
    security_groups = [var.ALB_SG]
}

resource "aws_lb_target_group" "ALB_TG" {
    name = var.ALB_TG_name
    vpc_id = var.vpc_id
    port = var.ALB_TG_port
    protocol = var.ALB_TG_protocol
    target_type = var.ALB_TG_target_type

    health_check {
      path = var.ALB_TG_path
      protocol = var.ALB_TG_protocol
    }
}

resource "aws_lb_listener" "ALB_listener" {
    load_balancer_arn = aws_lb.ALB.id
    port = var.ALB_TG_port
    protocol = var.ALB_TG_protocol

    default_action {
      type = var.ALB_action_type
      target_group_arn = aws_lb_target_group.ALB_TG.arn
    } 
}