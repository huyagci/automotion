output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "PUBLIC_SUBNET_1A" {
  value = aws_subnet.public_subnet_1a.id
}

output "PUBLIC_SUBNET_1B" {
  value = aws_subnet.public_subnet_1b.id
}

output "PUBLIC_SUBNET_1C" {
  value = aws_subnet.public_subnet_1c.id
}

output "PRIVATE_SUBNET_1A" {
  value = aws_subnet.public_subnet_1a.id
}

output "PRIVATE_SUBNET_1B" {
  value = aws_subnet.public_subnet_1b.id
}

output "PRIVATE_SUBNET_1C" {
  value = aws_subnet.public_subnet_1c.id
}

output "ALB_SG_ID" {
  value = aws_security_group.alb_sg.id
}

output "ECS_SG_ID" {
  value = aws_security_group.ecs_sg.id
}
