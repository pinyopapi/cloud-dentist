module "s3" {
  source      = "../../modules/s3"
  bucket_name = "devops-demo-bucket-12345"
}

module "rds" {
  source          = "../../modules/rds"
  db_name         = "devdb"
  username        = "devuser"
  password        = "devpass"
  allocated_storage = 20
}