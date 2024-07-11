resource "aws_vpc" "aws_wordpress" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "aws_wordpress"
  }
}


# main.tf

provider "aws" {
  region = "us-west-2"  # Replace with your region
}

data "aws_vpc" "aws_wordpress" {
  filter {
    name   = "tag:Name"
    values = ["your-vpc-name"]  # Replace with your VPC name
  }
}

output "vpc_id" {
  value = data.aws_vpc.aws_wordpress.id
}
