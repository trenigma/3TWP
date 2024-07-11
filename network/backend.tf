# set remote backend

terraform {
  backend "s3" {
    bucket = "terraform-wordpress-1-state"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}