vpc_cidr                = "10.0.0.0/16"
env                     = "Dev"
region                  = "us-east-1"
ubuntu_ami              = "ami-0fd63e471b04e22d0" #Ami for this region
availability_zone_names = ["us-east-1a", "us-east-1b"]
public_subnet1_cidr     = "10.0.1.0/24"
public_subnet2_cidr     = "10.0.3.0/24"
private_subnet1_cidr    = "10.0.4.0/24"
private_subnet2_cidr    = "10.0.2.0/24"

#RDS_REDIS module Variables
db_engine            = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
name                 = "mydb"
parameter_group_name = "default.mysql5.7"

redis_engine         = "redis"
redis_node_type      = "cache.t2.micro"
