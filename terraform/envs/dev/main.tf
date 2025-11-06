######################################
#  Dev environment main configuration
######################################

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "devops-demo-bucket-12345"
}

module "eks" {
  source       = "../../modules/eks"
  cluster_name = "devops-demo-eks"
  region       = "eu-central-1"
}

module "rds" {
  source            = "../../modules/rds"
  db_name           = "devdb"
  username          = "devuser"
  password          = "devpass"
  allocated_storage = 20

  vpc_id     = module.eks.vpc_id
  subnet_ids = module.eks.subnet_ids
}