terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-123"
    key            = "challenge/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}