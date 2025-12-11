resource "aws_lb" "ILB" {
    name = var.ILB_name
    load_balancer_type = var.load_balancer_type
    internal = var.ILB_internal
    subnets = var.pvt_subnets
    security_groups = [var.ILB_SG]          
}

resource "aws_lb_target_group" "ILB_TG" {
    vpc_id = var.vpc_id
    name = var.ILB_TG_name
    port = var.ILB_port
    protocol = var.ILB_protocol
    target_type = var.ILB_target_type

    health_check {
      path = var.ILB_path
      protocol = var.ILB_protocol
    } 
}

resource "aws_lb_listener" "ILB_listener" {
    port = var.ILB_port
    protocol = var.ILB_protocol
    load_balancer_arn = aws_lb.ILB.id

    default_action {
      target_group_arn = aws_lb_target_group.ILB_TG.id
      type = var.ILB_action_type
    }  
}