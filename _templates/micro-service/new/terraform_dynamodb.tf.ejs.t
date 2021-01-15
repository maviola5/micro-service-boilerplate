---
to: terraform/dynamodb.tf
---
resource "aws_dynamodb_table" "micro_service" {
  <%= name.toLowerCase() %>         = "${local.application}-ms-data"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "timestamp"

  attribute {
    <%= name.toLowerCase() %> = "id"
    type = "S"
  }

  attribute {
    <%= name.toLowerCase() %> = "timestamp"
    type = "S"
  }
}
