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
