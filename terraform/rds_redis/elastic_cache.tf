resource "aws_elasticache_subnet_group" "redis_sub_group" {
  name       = "redis-sub"
  subnet_ids = [var.private_sub1_id, var.private_sub2_id]
}


resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis"
  engine               = var.redis_engine
  node_type            = var.redis_node_type #"cache.t2.micro"
  security_group_ids =   [var.security_gb_id]
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis_sub_group.name
}