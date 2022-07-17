output "SCALE_OUT_POLICY_ARN" {
  value = aws_appautoscaling_policy.scale_out.arn
}

output "SCALE_IN_POLICY_ARN" {
  value = aws_appautoscaling_policy.scale_in.arn
}
