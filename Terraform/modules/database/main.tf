resource "aws_db_subnet_group" "main" {
  name       = "db-subnet-group"
  subnet_ids = [var.subnet_id]
  tags       = var.tags
}

resource "aws_security_group" "database" {
  name   = "allow_mysql"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
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

resource "aws_db_instance" "main" {
  allocated_storage      = 2
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]
  tags                   = var.tags
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}


