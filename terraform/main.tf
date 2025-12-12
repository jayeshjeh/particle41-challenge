

terraform {
  backend "s3" {
    bucket       = "my-terraform-state-bucket-unique-122"
    key          = "dev/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-1"
  }
}