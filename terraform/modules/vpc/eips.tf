resource "aws_eip" "eip_1a" {
  network_border_group = var.AWS_SELECTED_REGION
  public_ipv4_pool     = "amazon"
}

resource "aws_eip" "eip_1b" {
  network_border_group = var.AWS_SELECTED_REGION
  public_ipv4_pool     = "amazon"
}

resource "aws_eip" "eip_1c" {
  network_border_group = var.AWS_SELECTED_REGION
  public_ipv4_pool     = "amazon"
}
