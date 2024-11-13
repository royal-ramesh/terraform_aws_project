

data "aws_availability_zones" "available" {
    state = "available"
}



module "ipam" {
    source = "../../modules/ipam"
    #aws_profile = var.aws_profile
    region = var.region
    address_family = var.address_family
    pool_cidr = var.pool_cidr
    #allocation_default_netmask_length = var.netmask_length
    #cidr = var.pool_cidr
    tags={
        Name=var.vpc_name
    } 

  
}



module "vpc" {
  source = "../../modules/vpc"
  
  #region = var.region
    #aws_profile = var.aws_profile 

  vpc_id = module.vpc.vpc_id
  cidr_block = module.ipam.ipam_pool_cidr
  availability_zone = data.aws_availability_zones.available.all_availability_zones
  #map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name=var.vpc_name
  }
  depends_on = [module.ipam]
}


module "public_subnet" {
    source = "../../modules/subnets"
    vpc_id =module.vpc.vpc_id
    #region = var.region
    #aws_profile = var.aws_profile 
    count = var.public_subnet_count != null ? var.public_subnet_count : length(data.aws_availability_zones.available.names)
    cidr_block = cidrsubnet(module.vpc.cidr_block,8,count.index)
    map_public_ip_on_launch = var.map_public_ip_on_launch
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
      
    }
    depends_on = [module.vpc] 
}



module "private_subnet" {
    source = "../../modules/subnets"
    #region = var.region
    #aws_profile = var.aws_profile 
    vpc_id=module.vpc.vpc_id
    count = var.private_subnet_count != null ? var.private_subnet_count : length(data.aws_availability_zones.available.names )
    availability_zone=data.aws_availability_zones.available.names[count.index]
    cidr_block=cidrsubnet(module.vpc.cidr_block,8,count.index+5)
    map_public_ip_on_launch = var.map_public_ip_on_launch
    tags={
        
    }
    depends_on = [module.vpc] 
} 






