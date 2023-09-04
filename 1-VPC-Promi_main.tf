#1 - tf file para crear la VPC main
# Main VPC Promi
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "VPC_Promi_main" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "VPC_Promi_main"
  }
}
