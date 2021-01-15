---
to: terraform/main.tf
---
locals {
  application   = "micro-service"
  <%= name.toLowerCase() %>          = "rest-handler"
  function_<%= name.toLowerCase() %> = "${local.application}-${local.<%= name.toLowerCase() %>}"
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
