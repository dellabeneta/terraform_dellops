terraform {
  backend "s3" {
    bucket  = "terraform-infra-dellops"
    key     = "terraform.tfstate"
    region  = "us-east-1"
  }
}