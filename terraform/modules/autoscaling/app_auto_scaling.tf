# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target
resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 9
  min_capacity       = 3
  resource_id        = "service/${var.ECS_CLUSTER_NAME}/${var.ECS_SERVICE_NAME}"
  role_arn           = var.ECS_APP_AUTO_SCALE_SL_ROLE_ARN
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy
resource "aws_appautoscaling_policy" "scale_out" {
  name               = "ecs-scale-out"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.ecs_target]
}

resource "aws_appautoscaling_policy" "scale_in" {
  name               = "ecs-scale-in"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Minimum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.ecs_target]
}


