# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard
resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard" {
  dashboard_name = "protein-app-dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "height": 5,
      "width": 7,
      "y": 5,
      "x": 17,
      "type": "metric",
      "properties": {
        "metrics": [[{ "expression": "SEARCH('{AWS/ApplicationELB,LoadBalancer} MetricName=\"RequestCount\" ', 'Sum', 300)", "region": "${var.AWS_SELECTED_REGION}" }]],
        "legend": {
          "position": "bottom"
        },
        "title": "Requests",
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "period": 300,
        "view": "timeSeries",
        "stacked": false,
        "stat": "Average"
      }
    },
    {
      "height": 5,
      "width": 7,
      "y": 0,
      "x": 10,
      "type": "metric",
      "properties": {
        "metrics": [[{ "expression": "SEARCH('{AWS/ApplicationELB,LoadBalancer} MetricName=\"ActiveConnectionCount\" ', 'Sum', 300)", "region": "${var.AWS_SELECTED_REGION}" }]],
        "legend": {
          "position": "bottom"
        },
        "title": "Active Connections",
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "period": 300
      }
    },
    {
      "height": 5,
      "width": 7,
      "y": 5,
      "x": 10,
      "type": "metric",
      "properties": {
        "metrics": [[{ "expression": "SEARCH('{AWS/ApplicationELB,LoadBalancer} MetricName=\"NewConnectionCount\" ', 'Sum', 300)" }]],
        "legend": {
          "position": "bottom"
        },
        "title": "New Connections",
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false
      }
    },
    {
      "height": 5,
      "width": 3,
      "y": 0,
      "x": 0,
      "type": "metric",
      "properties": {
        "metrics": [["AWS/Billing", "EstimatedCharges", "Currency", "USD"]],
        "legend": {
          "position": "bottom"
        },
        "yAxis": {
          "left": {
            "showUnits": false,
            "label": "USD"
          }
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "title": "Forecasted Charges",
        "view": "singleValue",
        "stacked": false,
        "period": 2592000,
        "stat": "Maximum"
      }
    },
    {
      "height": 5,
      "width": 5,
      "y": 10,
      "x": 0,
      "type": "metric",
      "properties": {
        "metrics": [
          ["AWS/ECS", "CPUUtilization", "ClusterName", "${var.ECS_CLUSTER_NAME}", "ServiceName", "${var.ECS_SERVICE_NAME}", { "stat": "Average" }],
          ["ECS/ContainerInsights", "MemoryUtilized", "ServiceName", "${var.ECS_SERVICE_NAME}", "ClusterName", "${var.ECS_CLUSTER_NAME}", { "stat": "Average", "visible": false }]
        ],
        "legend": {
          "position": "bottom"
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "title": "Resource Utilizations",
        "period": 300,
        "view": "timeSeries",
        "stacked": false
      }
    },
    {
      "height": 5,
      "width": 5,
      "y": 10,
      "x": 5,
      "type": "metric",
      "properties": {
        "metrics": [
          ["AWS/ECS", "MemoryUtilization", "ClusterName", "${var.ECS_CLUSTER_NAME}", "ServiceName", "${var.ECS_SERVICE_NAME}", { "stat": "Average" }],
          ["...", "${var.ECS_SERVICE_NAME}", { "stat": "Average", "visible": false }]
        ],
        "legend": {
          "position": "bottom"
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "title": "Memory Utilization",
        "period": 300,
        "view": "timeSeries",
        "stacked": false
      }
    },
    {
      "height": 5,
      "width": 10,
      "y": 5,
      "x": 0,
      "type": "metric",
      "properties": {
        "metrics": [
          ["ECS/ContainerInsights", "CpuUtilized", "ClusterName", "${var.ECS_CLUSTER_NAME}", { "id": "mm1m0" }],
          [".", "MemoryUtilized", "ServiceName", "${var.ECS_SERVICE_NAME}", "ClusterName", "${var.ECS_CLUSTER_NAME}"]
        ],
        "legend": {
          "position": "bottom"
        },
        "title": "Resource Utilizations",
        "yAxis": {
          "left": {
            "min": 0,
            "showUnits": false,
            "label": "Percent",
            "max": 256
          }
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "period": 300,
        "view": "gauge",
        "stacked": false,
        "stat": "Average"
      }
    },
    {
      "height": 5,
      "width": 14,
      "y": 10,
      "x": 10,
      "type": "metric",
      "properties": {
        "metrics": [
          [{ "id": "expr1m0", "label": "${var.ECS_CLUSTER_NAME}", "expression": "RATE(mm0m0) + RATE(mm1m0)", "region": "${var.AWS_SELECTED_REGION}" }],
          ["ECS/ContainerInsights", "NetworkRxBytes", "ClusterName", "${var.ECS_CLUSTER_NAME}", { "period": 300, "stat": "Average", "id": "mm0m0", "visible": false, "region": "${var.AWS_SELECTED_REGION}" }],
          ["ECS/ContainerInsights", "NetworkTxBytes", "ClusterName", "${var.ECS_CLUSTER_NAME}", { "period": 300, "stat": "Average", "id": "mm1m0", "visible": false, "region": "${var.AWS_SELECTED_REGION}" }]
        ],
        "legend": {
          "position": "bottom"
        },
        "title": "Network",
        "yAxis": {
          "left": {
            "showUnits": false,
            "label": "Bytes/Second"
          }
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "period": 300
      }
    },
    {
      "height": 5,
      "width": 7,
      "y": 0,
      "x": 17,
      "type": "metric",
      "properties": {
        "metrics": [["ECS/ContainerInsights", "TaskCount", "ClusterName", "${var.ECS_CLUSTER_NAME}", { "period": 300, "stat": "Average" }]],
        "legend": {
          "position": "bottom"
        },
        "title": "ECS Task Count",
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false
      }
    },
    {
      "height": 5,
      "width": 7,
      "y": 0,
      "x": 3,
      "type": "metric",
      "properties": {
        "metrics": [
          ["ECS/ContainerInsights", "CpuReserved", "ServiceName", "${var.ECS_SERVICE_NAME}", "ClusterName", "${var.ECS_CLUSTER_NAME}"],
          [".", "MemoryReserved", ".", ".", ".", "."]
        ],
        "legend": {
          "position": "bottom"
        },
        "region": "${var.AWS_SELECTED_REGION}",
        "liveData": false,
        "title": "Resource Reservations",
        "view": "singleValue",
        "stacked": true,
        "period": 300,
        "stat": "Maximum",
        "yAxis": {
          "left": {
            "min": 0
          }
        },
        "singleValueFullPrecision": false,
        "sparkline": false
      }
    }
  ]
}

EOF
}
