data "aws_route_table" "current" {
    route_table_id = "rtb-089e47eed4b8900a3"
    

}

resource "aws_route" "igw_route" {
    for_each = toset(var.igw_routes)
    route_table_id = data.aws_route_table.current.id
    destination_cidr_block = each.value
    gateway_id = aws_internet_gateway.igw.id

    lifecycle {
    create_before_destroy = true
  }
  
}
