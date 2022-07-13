output "ECS_TASK_EXEC_ROLE_ARN" {
  value = data.aws_iam_role.ecs_task_exec_role.arn
}
