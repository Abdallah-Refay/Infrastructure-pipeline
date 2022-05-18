module "network" {
  source                  = "./network"
  vpc_cidr                = var.vpc_cidr
  env                     = var.env
  region                  = var.region
  availability_zone_names = var.availability_zone_names
  public_subnet1_cidr     = var.public_subnet1_cidr
  public_subnet2_cidr     = var.public_subnet2_cidr
  private_subnet1_cidr    = var.private_subnet1_cidr
  private_subnet2_cidr    = var.private_subnet2_cidr
}

module "rds_redis" {
  source               = "./rds_redis"
  env                  = var.env
  engine               = var.db_engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  security_gb_id       = aws_security_group.security-db.id
  private_sub1_id      = module.network.private_sub1_id
  private_sub2_id      = module.network.private_sub2_id

  redis_engine = var.redis_engine
  redis_node_type = var.redis_node_type
}
