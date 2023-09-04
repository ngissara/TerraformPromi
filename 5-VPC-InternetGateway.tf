# Tf para la creacion del Internet Gateway
# Principal Internet Gateway para las subnets publicas

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.VPC_Promi_main.id
    tags = {
        Name = "igw"
    }
}