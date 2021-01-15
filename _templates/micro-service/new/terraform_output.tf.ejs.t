---
to: terraform/output.tf
---
output "invokeUrl" {
  value = aws_api_gateway_deployment.api
}
