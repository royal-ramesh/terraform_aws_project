
# creating and attaching IGW. newer tf versions does not require seperate resource for attachment
resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id


  tags = {
    Name="vpc-igw"
  }

  
}
/*resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id = module.vpc.vpc_id
} */