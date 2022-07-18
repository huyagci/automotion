# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
resource "aws_cloudwatch_metric_alarm" "ecs_high_cpu" {
  alarm_name          = "cpu_util_high"
  alarm_description   = "Cloudwatch metric alarm that triggers 'ecs-scale-out' policy."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "30"
  statistic           = "Average"
  threshold           = var.HIGH_CPU_THRESHOLD
  actions_enabled     = var.ENABLE_AUTOSCALE_OUT

  alarm_actions = [var.SCALE_OUT_POLICY_ARN]

  dimensions = {
    ClusterName = var.ECS_CLUSTER_NAME
    ServiceName = var.ECS_SERVICE_NAME
  }
}

resource "aws_cloudwatch_metric_alarm" "ecs_low_cpu" {
  alarm_name          = "cpu_util_low"
  alarm_description   = "Cloudwatch metric alarm that triggers 'ecs-scale-down' policy."
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "30"
  statistic           = "Average"
  threshold           = var.LOW_CPU_THRESHOLD
  actions_enabled     = var.ENABLE_AUTOSCALE_IN

  alarm_actions = [var.SCALE_IN_POLICY_ARN]

  dimensions = {
    ClusterName = var.ECS_CLUSTER_NAME
    ServiceName = var.ECS_SERVICE_NAME
  }
}
