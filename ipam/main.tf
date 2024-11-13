data "aws_region" "current" {}

# resources for for dynamic ip allocation to avoid overlap

#creating IPAM
resource "aws_vpc_ipam" "ipam" {
    operating_regions {
      region_name = data.aws_region.current.name
    }

    /*dynamic operating_regions{
        for_each = local.all_ipam_regions
      
    } */
  #tags = var.tags
}

#creating IPAM pool
resource "aws_vpc_ipam_pool" "ipam_pool" {
    
    ipam_scope_id = aws_vpc_ipam.ipam.private_default_scope_id
    address_family = var.address_family
    allocation_default_netmask_length = var.netmask_length
    auto_import = true
    #locale = data.aws_region.current
    tags=var.tags
 
}

#Allocating CIDR for IPAM pool
resource "aws_vpc_ipam_pool_cidr" "ipam_pool_cidr" {
    ipam_pool_id = aws_vpc_ipam_pool.ipam_pool.id
    cidr = var.pool_cidr
  
}
  
