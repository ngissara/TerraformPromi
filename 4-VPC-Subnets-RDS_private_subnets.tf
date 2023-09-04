# Este tf file, crea las Private subnets para RDS 

# Private subnet RDS-Pvt-subnet-1 10.10.2.0/25:
resource "aws_subnet" "RDS-Pvt-subnet-1" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.2.0/25"
  tags = {
    Name = "RDS-Pvt-subnet-1"
  }
}
# Private subnet RDS-Pvt-subnet-2 10.10.2.128/25:
resource "aws_subnet" "RDS-Pvt-subnet-2" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.2.128/25"
  tags = {
    Name = "RDS-Pvt-subnet-2"
  }
}
# Private subnet RDS-Pvt-subnet-3 10.10.3.0/25:
resource "aws_subnet" "RDS-Pvt-subnet-3" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.3.0/25"
  tags = {
    Name = "RDS-Pvt-subnet-3"
  }
}
# Private subnet RDS-Pvt-subnet-4 10.10.3.128/25:
resource "aws_subnet" "RDS-Pvt-subnet-4" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.3.128/25"
  tags = {
    Name = "RDS-Pvt-subnet-4"
  }
}
# Private subnet RDS-Pvt-subnet-5 10.10.4.0/25:
resource "aws_subnet" "RDS-Pvt-subnet-5" {
  vpc_id = aws_vpc.VPC_Promi_main.id
  cidr_block = "10.10.4.0/25"
  tags = {
    Name = "RDS-Pvt-subnet-5"
  }
}
