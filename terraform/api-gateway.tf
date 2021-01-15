resource "aws_api_gateway_rest_api" "api" {
  name        = local.application
  description = local.application
}

### PATHS ###
resource "aws_api_gateway_resource" "status" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "status"
}

### METHODS ###
resource "aws_api_gateway_method" "GET_status" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.status.id
  http_method   = "GET"
  authorization = "NONE"
}

### INTEGRATIONS ###
locals {
  apigw_methods = [
    aws_api_gateway_method.GET_status
  ]
}

resource "aws_api_gateway_integration" "integrations" {
  count                   = length(local.apigw_methods)
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = local.apigw_methods[count.index].resource_id
  http_method             = local.apigw_methods[count.index].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.function.invoke_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  # statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${local.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.api.id}/*/*"
}

resource "aws_api_gateway_deployment" "api" {
  depends_on  = [aws_api_gateway_integration.integrations]
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = local.application
}
