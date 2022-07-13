# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.VPC_CIDR

  tags = {
    Name = "p-app-vpc"
  }
}
