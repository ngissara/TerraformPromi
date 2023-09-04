# Tf file para la creacion de las asociaciones de las route tables con las subnets.

# Asociacion de la subnet publica 0
resource "aws_route_table_association" "public_subnet_association_0" {
  subnet_id      = aws_subnet.public_subnet0.id
  route_table_id = aws_route_table.public.id
}

# Asociacion de la subnet publica 1
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public.id
}

# Asociacion de la subnet privada 128
resource "aws_route_table_association" "private_subnet_association_128" {
  subnet_id      = aws_subnet.private_subnet128.id
  route_table_id = aws_route_table.private128.id
}

# Asociacion de la subnet privada 129
resource "aws_route_table_association" "private_subnet_association_129" {
  subnet_id      = aws_subnet.private_subnet129.id
  route_table_id = aws_route_table.private129.id
}

# Asociacion de la subnet privada para las RDS
#1
resource "aws_route_table_association" "private_subnet_association_RDS1" {
  subnet_id      = aws_subnet.RDS-Pvt-subnet-1.id
  route_table_id = aws_route_table.privateRDS.id
}
#2
resource "aws_route_table_association" "private_subnet_association_RDS2" {
  subnet_id      = aws_subnet.RDS-Pvt-subnet-2.id
  route_table_id = aws_route_table.privateRDS.id
}
#3
resource "aws_route_table_association" "private_subnet_association_RDS3" {
  subnet_id      = aws_subnet.RDS-Pvt-subnet-3.id
  route_table_id = aws_route_table.privateRDS.id
}
#4
resource "aws_route_table_association" "private_subnet_association_RDS4" {
  subnet_id      = aws_subnet.RDS-Pvt-subnet-4.id
  route_table_id = aws_route_table.privateRDS.id
}
#5
resource "aws_route_table_association" "private_subnet_association_RDS5" {
  subnet_id      = aws_subnet.RDS-Pvt-subnet-5.id
  route_table_id = aws_route_table.privateRDS.id
}