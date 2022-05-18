vpc_cidr                = "192.0.0.0/16"
env                     = "Prod"
region                  = "eu-west-2"
ubuntu_ami              = "ami-0b2834542914df958" #Ami for this region
availability_zone_names = ["eu-west-2a", "eu-west-2b"]
public_subnet1_cidr     = "192.0.1.0/24"
public_subnet2_cidr     = "192.0.3.0/24"
private_subnet1_cidr    = "192.0.0.0/24"
private_subnet2_cidr    = "192.0.2.0/24"

#RDS module Variables
db_engine            = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
name                 = "mydb"
parameter_group_name = "default.mysql5.7"

redis_engine         = "redis"
redis_node_type      = "cache.t2.micro"
