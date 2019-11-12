
provider "aws" {
  region = "${var.region}"
}

#I've commented this out - in the produdction best practice is to use a remote
#tfstate and dynamodb via locking. This is the convention.
#terraform {
#  required_version = ">= 0.11"
#  backend "s3" {
#    bucket         = "hahmoo-us-west-2-prod-tfstate-backend"
#    key            = "us-west-2/prod/vpc/terraform.tfstate"
#    region         = "us-west-2"
#    dynamodb_table = "tf-lock-us-west-2"
#  }
#}
