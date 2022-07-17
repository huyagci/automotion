# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}a"

  tags = {
    Name = "p-app-public-subnet-1a"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}b"

  tags = {
    Name = "p-app-public-subnet-1b"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}c"

  tags = {
    Name = "p-app-public-subnet-1c"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}a"

  tags = {
    Name = "p-app-private-subnet-1a"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}b"

  tags = {
    Name = "p-app-private-subnet-1b"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "${var.AWS_SELECTED_REGION}c"

  tags = {
    Name = "p-app-private-subnet-1c"
  }

  depends_on = [aws_vpc.vpc]
}
