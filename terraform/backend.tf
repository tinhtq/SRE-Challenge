terraform {
  backend "s3" {
    bucket  = "terraform-state-559050245666-us-east-1"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "challenge"
  }
}
