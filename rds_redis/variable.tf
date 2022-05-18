variable "env" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "name" {}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "parameter_group_name" {}
variable "security_gb_id" {}
variable "private_sub1_id" {}
variable "private_sub2_id" {}

variable "redis_engine" {}
variable "redis_node_type" {}


