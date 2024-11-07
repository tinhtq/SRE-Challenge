terraform {
  backend "s3" {
    bucket  = "terraform-state-559050245666"
    key     = "terraform.tfstate"
    region  = "us-east-2"
    profile = "challenge"
  }
}
