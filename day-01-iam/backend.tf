terraform {
  backend "s3" {
    bucket         = "aws-tf-lab-state-<ACCOUNT_ID>"
    key            = "day-01-iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-tf-lab-lock"
    encrypt        = true
  }
}
