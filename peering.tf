resource "aws_vpc_peering_connection" "default_roboshop" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.default_vpc_id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between default and roboshop vpc"
  }
}

resource "aws_route" "default" {
    count = var.is_peering_required ? 1 : 0
  route_table_id            = var.default_route_table
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default_roboshop[0].id
}

resource "aws_route" "public_peering" {
    count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.default_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default_roboshop[0].id
}


resource "aws_route" "private_peering" {
    count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.default_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default_roboshop[0].id
}

resource "aws_route" "database_peering" {
    count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = var.default_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default_roboshop[0].id
}