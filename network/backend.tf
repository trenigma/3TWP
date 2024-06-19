# config to set backend as remote 

terraform {
  backend "s3" {
    bucket = "terraform-wordpress-1-state"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

