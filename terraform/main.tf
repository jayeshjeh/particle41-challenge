terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-122"
    key            = "challenge/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}