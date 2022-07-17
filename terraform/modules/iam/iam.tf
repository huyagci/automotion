# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

# Required for ECS Task Definition 
data "aws_iam_role" "ecs_task_exec_role" {
  name = "ecsTaskExecutionRole"
}

# Required for Application Auto Scaling
resource "aws_iam_service_linked_role" "ecs_app_auto_scale_sl_role" {
  aws_service_name = "ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"
}
