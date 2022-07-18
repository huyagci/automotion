# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard
resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard" {
  dashboard_name = "protein-app-dashboard"

  dashboard_body = jsondecode(file("./modules/cloudwatch/dashboard.json"))
}
