variable "vpc_cidr" {
  type = string
}

variable "env" {
  type = string
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
