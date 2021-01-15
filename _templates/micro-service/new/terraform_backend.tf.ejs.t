---
to: terraform/backend.tf
---
terraform {
  backend "s3" {
    bucket = "mviola5-terraform-state"
    key    = "micro-service"
    region = "us-east-1"
  }
}
