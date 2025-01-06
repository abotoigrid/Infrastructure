resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags       = var.tags
}

resource "aws_subnet" "main_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block_a
  availability_zone = "eu-central-1a"
  tags              = var.tags
}

resource "aws_subnet" "main_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block_b
  availability_zone = "eu-central-1b"
  tags              = var.tags
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

}

resource "aws_route_table_association" "main_a" {
  subnet_id      = aws_subnet.main_a.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_b" {
  subnet_id      = aws_subnet.main_b.id
  route_table_id = aws_route_table.main.id
}

resource "aws_security_group" "allow_http_ssh" {
  name   = "allow_http_ssh"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}