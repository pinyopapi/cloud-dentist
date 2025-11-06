module "s3" {
  source      = "../../modules/s3"
  bucket_name = "devops-demo-bucket-12345"
}

module "rds" {
  source            = "../../modules/rds"
  db_name           = "devdb"
  username          = "devuser"
  password          = "devpass"
  allocated_storage = 20

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "vpc" {
  source = "../../modules/vpc"
}