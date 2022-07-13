output "ALB_SG_ID" {
  value = aws_security_group.alb_sg.id
}

output "ECS_SG_ID" {
  value = aws_security_group.ecs_sg.id
}
