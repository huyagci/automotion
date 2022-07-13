# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
resource "aws_lb" "alb" {
  name               = "p-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ALB_SG_ID]
  subnets            = [var.PUBLIC_SUBNET_1A, var.PUBLIC_SUBNET_1B, var.PUBLIC_SUBNET_1C]

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
