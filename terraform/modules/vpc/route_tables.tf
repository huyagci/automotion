# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "p-app-rtb-public"
  }

  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw]
}

resource "aws_route_table" "private_rtb_1a" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = aws_subnet.private_subnet_1a.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw_1a.id
  }

  tags = {
    Name = "p-app-rtb-private-1a"
  }

  depends_on = [aws_vpc.vpc, aws_subnet.private_subnet_1a, aws_nat_gateway.ngw_1a]
}

resource "aws_route_table" "private_rtb_1b" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = aws_subnet.private_subnet_1b.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw_1b.id
  }

  tags = {
    Name = "p-app-rtb-private-1b"
  }

  depends_on = [aws_vpc.vpc, aws_subnet.private_subnet_1b, aws_nat_gateway.ngw_1b]
}

resource "aws_route_table" "private_rtb_1c" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = aws_subnet.private_subnet_1c.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw_1c.id
  }

  tags = {
    Name = "p-app-rtb-private-1c"
  }

  depends_on = [aws_vpc.vpc, aws_subnet.private_subnet_1c, aws_nat_gateway.ngw_1c]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rtb_1a.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_rtb_1b.id
}
resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rtb_1c.id
}
