resource "aws_db_subnet_group" "db-sub-groub" {
  name       = "subnet-group"
  subnet_ids = [var.private_sub1_id, var.private_sub2_id]
}


resource "aws_db_instance" "mysql_instance" {
  # Allocating the storage for database instance.
  allocated_storage = 10
  # Declaring the database engine and engine_version
  engine         = var.engine
  engine_version = var.engine_version
  # Declaring the instance class
  instance_class       = var.instance_class
  name                 = var.name
  db_subnet_group_name = aws_db_subnet_group.db-sub-groub.name
  # User to connect the database instance 
  username = var.username
  # Password to connect the database instance 
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  vpc_security_group_ids = [var.security_gb_id]
  skip_final_snapshot  = true

  tags = {
    Name = "db-instance"
  }
}
