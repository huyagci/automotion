# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
resource "aws_ecs_cluster" "cluster" {
  name = "p-app-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers
resource "aws_ecs_cluster_capacity_providers" "cluster_cps" {
  cluster_name = aws_ecs_cluster.cluster.id

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
