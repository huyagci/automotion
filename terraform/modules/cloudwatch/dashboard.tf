resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard" {
  dashboard_name = "protein-app-dashboard"

  dashboard_body = jsondecode(file("./dashboard.json"))
}
