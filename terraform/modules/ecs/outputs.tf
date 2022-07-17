output "ECS_CLUSTER_NAME" {
  value = aws_ecs_cluster.cluster.name
}

output "ECS_SERVICE_NAME" {
  value = aws_ecs_service.service.name
}
