output "TARGET_GROUP_ARN" {
  value = aws_lb_target_group.alb_tg.arn
}

output "ALB_LISTENER" {
  value = aws_lb_listener.alb_listener
}
