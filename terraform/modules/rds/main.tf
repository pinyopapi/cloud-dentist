resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  publicly_accessible  = false
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}