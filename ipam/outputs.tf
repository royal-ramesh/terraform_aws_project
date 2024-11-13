output "ipam_id" {
  value = aws_vpc_ipam.ipam.id
}

output "ipam_pool_id" {
  value = aws_vpc_ipam_pool.ipam_pool.id
}

/*output "allocated_cidr" {
  value = aws_vpc_ipam_pool_cidr.ipam_pool_cidr.cidr
} */

output "ipam_pool_cidr" {
  value = aws_vpc_ipam_pool_cidr.ipam_pool_cidr.cidr
  description = "The CIDR block allocated by IPAM"
}