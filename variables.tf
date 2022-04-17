variable "vpc_cidr" {
  type = string
}

variable "env" {
  type = string
}

variable "ubuntu_ami" {
  type        = string
  description = "The id of ubuntu AMI according to the region"
}

variable "region" {
  type = string
}
variable "availability_zone_names" {
  type = list(string)
}



variable "public_subnet1_cidr" {
  type = string
}

variable "public_subnet2_cidr" {
  type = string
}

variable "private_subnet1_cidr" {
  type = string
}

variable "private_subnet2_cidr" {
  type = string
}