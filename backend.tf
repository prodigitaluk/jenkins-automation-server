terraform {
  backend "s3" {
    bucket = "terraform-bluelambda-19102024"
    key    = "medical-app/infra.tfstate"
    region = "eu-west-2"
  }
}
