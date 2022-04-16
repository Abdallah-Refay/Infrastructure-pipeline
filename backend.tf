terraform {
  backend "s3" {
    bucket         = "terraform-backend-init"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}