# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
resource "aws_lb_target_group" "alb_tg" {
  name        = "p-app-alb-tg"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VPC_ID

  health_check {
    enabled             = true
    path                = "/"
    port                = "traffic-port"
    interval            = 60
    timeout             = 5
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
}
