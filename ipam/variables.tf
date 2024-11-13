variable "region" {
  description = "AWS region"
  type        = string
}

variable "address_family" {
  description = "Address family for the IPAM pool"
  type        = string
  default     = "ipv4"
}

variable "netmask_length" {
  description = "Default netmask length for CIDR allocation"
  type        = number
  default     = 24
}

variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
}

variable "pool_cidr" {
  description = "CIDR block for the IPAM pool"
  type        = string
}