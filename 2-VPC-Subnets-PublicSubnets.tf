# Public Subnets - tf file para su creacion

# Public subnet0 10.10.0.0/24:

resource "aws_subnet" "public_subnet0" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "publicsubnet0"
  }
}

# Public subnet1 10.10.1.0/24:

resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.1.0/24"
  tags = {
    Name = "publicsubnet1"
  }
}
