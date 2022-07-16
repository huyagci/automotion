resource "aws_nat_gateway" "ngw_1a" {
  allocation_id     = aws_eip.eip_1a.allocation_id
  connectivity_type = "public"
  subnet_id         = aws_subnet.private_subnet_1a.id

  tags = {
    Name = "p-app-ngw-1a"
  }
}

resource "aws_nat_gateway" "ngw_1b" {
  allocation_id     = aws_eip.eip_1b.allocation_id
  connectivity_type = "public"
  subnet_id         = aws_subnet.private_subnet_1b.id

  tags = {
    Name = "p-app-ngw-1b"
  }
}

resource "aws_nat_gateway" "ngw_1c" {
  allocation_id     = aws_eip.eip_1c.allocation_id
  connectivity_type = "public"
  subnet_id         = aws_subnet.private_subnet_1c.id

  tags = {
    Name = "p-app-ngw-1c"
  }
}
