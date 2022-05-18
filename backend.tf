terraform {
  backend "s3" {
    bucket         = "terraform-backend-refay"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "state-lock"
  }
}