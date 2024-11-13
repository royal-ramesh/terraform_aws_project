variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
} 

variable "map_public_ip_on_launch" {
  description = "Whether to assign public IPs to instances in the subnet"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}