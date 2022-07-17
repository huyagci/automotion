# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "alb_sg" {
  name   = "p-app-lb-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.IPV4_CIDR_BLOCK]
    ipv6_cidr_blocks = [var.IPV6_CIDR_BLOCK]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.IPV4_CIDR_BLOCK]
    ipv6_cidr_blocks = [var.IPV6_CIDR_BLOCK]
  }
}

resource "aws_security_group" "ecs_sg" {
  name   = "p-app-ecs-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.IPV4_CIDR_BLOCK]
    ipv6_cidr_blocks = [var.IPV6_CIDR_BLOCK]
  }
}
