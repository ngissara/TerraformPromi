# TF file para la creacion de las route tables 

# Route Table publica para las subnets publicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.VPC_Promi_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = "172.16.0.0/12"
    gateway_id = "vgw-012b5c6d1125f1371"
  }
  tags = {
    Name = "RouteTablePublica"
  }
}

# Route Table main
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.VPC_Promi_main.id

  route {
    cidr_block = "172.16.0.0/12"
    gateway_id = "vgw-012b5c6d1125f1371"
  }
  tags = {
    Name = "routetableMain"
  }
}

# Route Table para la subnet privada 128
resource "aws_route_table" "private128" {
  vpc_id = aws_vpc.VPC_Promi_main.id

  route {
    cidr_block = "172.16.0.0/12"
    gateway_id = "vgw-012b5c6d1125f1371"
  }
  tags = {
    Name = "RouteTablePrivada-128"
  }
}

# Route Table para la subnet privada 129
resource "aws_route_table" "private129" {
  vpc_id = aws_vpc.VPC_Promi_main.id

  route {
    cidr_block = "172.16.0.0/12"
    gateway_id = "vgw-012b5c6d1125f1371"
  }
  tags = {
    Name = "RouteTablePrivada-129"
  }
}

# Route Table para las subnets privadas de RDS
resource "aws_route_table" "privateRDS" {
  vpc_id = aws_vpc.VPC_Promi_main.id

  route {
    cidr_block = "172.16.0.0/12"
    gateway_id = "vgw-012b5c6d1125f1371"
  }
  tags = {
    Name = "RDS-Pvt-rt"
  }
}
