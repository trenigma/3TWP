
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-wordpress-1-state"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_vpc" "aws_wordpress" {
  filter {
    name = "tag:Name"
    #values = ["vpc"]
    values = ["aws_wordpress"]
  }
}