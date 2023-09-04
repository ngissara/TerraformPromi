#  Resource: aws_security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "webserver_security_group" {
  name_prefix = "webserver_security_group-"
  description = "Security group for webservers"
  vpc_id = aws_vpc.VPC_Promi_main.id

  // Additional configuration for your security group

  // Inbound rule 1: HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS requests allowed"
  }

  // Inbound rule 2: HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP requests allowed"
  }

  // Inbound rule 3: SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/12"]
    description = "SSH for admin"
  }
    // Inbound rule 4: ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.16.0.0/12"]
    description = "ICMPv4"
  }


  // Egress rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = {
    Name = "webserver_security_group"
  }
}

resource "aws_security_group" "wordpress_security_group" {
  vpc_id = aws_vpc.VPC_Promi_main.id
    description = "Sec group for wordpress webserver in testing environmnt"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "HTTPS requests allowed"
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "http requests allowed"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = [
                "172.16.0.0/12",
            ]
            description      = "SSH for admin"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    tags        = {
        "Name" = "SG-WordpressTest"
    }
}

#SEC group RDS

resource "aws_security_group" "ec2-rds-1" {
    vpc_id = aws_vpc.VPC_Promi_main.id
    description = "Security group attached to instances to securely connect to database-1wordpresstesting. Modification could lead to connection loss."
    egress      = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections to database-1wordpresstesting from any instances this security group is attached to"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-0d74aed7e35bca7f1",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    ingress     = []
    name        = "ec2-rds-1"
}

resource "aws_security_group" "ec2-rds-2"{
    description = "Security group attached to instances to allow them to securely connect to database-1. Modification could lead to connection loss."
    egress      = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections to database-1 from any instances this security group is attached to"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-094581a0e50283122",
            ]
            self             = false
            to_port          = 3306
        },
    ]

    ingress     = []
    name        = "ec2-rds-2"
    vpc_id = aws_vpc.VPC_Promi_main.id
}
resource "aws_security_group" "ec2-rds-3"{
    description = "Security group attached to instances to securely connect to wordpress-db. Modification could lead to connection loss."
    egress      = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections to wordpress-db from any instances this security group is attached to"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-0820687ee45c63d20",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    ingress     = []
    name        = "ec2-rds-3"
    vpc_id = aws_vpc.VPC_Promi_main.id
}

resource "aws_security_group" "ec2-rds-4"{
    description = "Security group attached to instances to securely connect to wordpress-db02. Modification could lead to connection loss."
    egress      = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections to wordpress-db02 from any instances this security group is attached to"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-094e1376e2d69ff44",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    ingress     = []
    name        = "ec2-rds-4"
    vpc_id = aws_vpc.VPC_Promi_main.id
}

resource "aws_security_group" "rds-ec2-1"{
    description = "Security group attached to database-1wordpresstesting to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."
    egress      = []
    ingress     = [
        {
            cidr_blocks      = [
                "10.10.0.0/16",
            ]
            description      = ""
            from_port        = -1
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "icmp"
            security_groups  = []
            self             = false
            to_port          = -1
        },
        {
            cidr_blocks      = [
                "10.10.0.0/16",
            ]
            description      = ""
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3306
        },
        {
            cidr_blocks      = []
            description      = "Rule to allow connections from EC2 instances with sg-0985a0f033641efa2 attached"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-0985a0f033641efa2",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    name        = "rds-ec2-1"
    vpc_id = aws_vpc.VPC_Promi_main.id
}

resource "aws_security_group" "rds-ec2-2"{
        description = "Security group attached to database-1 to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."
    egress      = []
    ingress     = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections from EC2 instances with sg-0161a0b7b16638ca0 attached"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-0161a0b7b16638ca0",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    name        = "rds-ec2-2"
    vpc_id = aws_vpc.VPC_Promi_main.id
}

resource "aws_security_group" "rds-ec2-3"{
    vpc_id = aws_vpc.VPC_Promi_main.id
    description = "Security group attached to wordpress-db to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."
    egress      = []
    ingress     = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections from EC2 instances with sg-035f1448141ac587a attached"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-035f1448141ac587a",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    name        = "rds-ec2-3"    
}

resource "aws_security_group" "rds-ec2-4"{
    vpc_id = aws_vpc.VPC_Promi_main.id
    description = "Security group attached to wordpress-db02 to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."        
    egress      = []
    ingress     = [
        {
            cidr_blocks      = []
            description      = "Rule to allow connections from EC2 instances with sg-050863c64c17e89c6 attached"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-050863c64c17e89c6",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    name        = "rds-ec2-4"   
}
resource "aws_security_group" "testing-sg-terraformgithubactions"{
    vpc_id = aws_vpc.VPC_Promi_main.id
    description = "Security for testing."        
    egress      = []
    ingress      = []
}