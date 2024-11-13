variable "terraform_version" {
  default = "1.9.8"
}
variable "region" {
  default = "ap-south-1"
}
variable "aws_version" {
  default = "5.75.0"
}
variable "aws_profile" {
  default = "administrator"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

/*variable "tags" {
  type        = map(string)
} */


#variable "availability_zone" {}

variable "map_public_ip_on_launch" {
  type = bool
  default = true
}
variable "address_family" {
  default = "ipv4"
}
variable "netmask_length" {
  default = "16"
}
variable "pool_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet_count" {
  type = number
  default = 1
}
variable "private_subnet_count" {
  type = number
  default = 1
}
