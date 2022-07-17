output "ECS_TASK_EXEC_ROLE_ARN" {
  value = data.aws_iam_role.ecs_task_exec_role.arn
}

output "ECS_APP_AUTO_SCALE_SL_ROLE_ARN" {
  value = aws_iam_service_linked_role.ecs_app_auto_scale_sl_role.arn
}
