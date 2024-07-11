terraform {
  backend "s3" {
    bucket = "terraform-wordpress-1-state"
    key    = "application/terraform.tfstate"
    region = "us-west-2"

  }
}
