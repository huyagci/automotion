# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
data "aws_iam_role" "ecs_task_exec_role" {
  name = "ecsTaskExecutionRole"
}
