
output "db_address" {
  value =aws_db_instance.mysql_instance.address
}

output "db_user" {
  value =aws_db_instance.mysql_instance.username
}

output "db_password" {
  value =aws_db_instance.mysql_instance.password
}

output "db_port" {
  value =aws_db_instance.mysql_instance.port
}

output "redis_host" {
  value =aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "redis_port" {
  value =aws_elasticache_cluster.redis.port
}




