terraform {
  backend "s3" {
    bucket         = "refay-terraform-backend"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "state-lock"
  }
}