provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
}

module "iam_roles" {
  source = "./modules/iam_roles"
}

module "lambda_functions" {
  source = "./modules/lambda_functions"
}
