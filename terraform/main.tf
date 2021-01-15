locals {
  application   = "micro-service"
  name          = "rest-handler"
  function_name = "${local.application}-${local.name}"
  filename      = "../dist/handler.zip"
  region        = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}
