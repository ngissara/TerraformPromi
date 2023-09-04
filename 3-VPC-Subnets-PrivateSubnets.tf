# Tf Files para la creacion de las Private Subnets


# Private subnet128 10.10.128.0/24:

resource "aws_subnet" "private_subnet128" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.128.0/24"
  tags = {
    Name = "privatesubnet128"
  }
}

# Private subnet129 10.10.129.0/24:
resource "aws_subnet" "private_subnet129" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.129.0/24"
  tags = {
    Name = "privatesubnet129"
  }
}


