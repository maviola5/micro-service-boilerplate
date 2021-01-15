---
to: terraform/cloudwatch.tf
---

# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "function_log_group" {
  <%= name.toLowerCase() %> = "/aws/lambda/${local.function_<%= name.toLowerCase() %>}"
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "lambda_logging" {
  <%= name.toLowerCase() %>        = "${local.function_<%= name.toLowerCase() %>}-lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:*:*",
          "Effect" : "Allow"
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.execution_role.<%= name.toLowerCase() %>
  policy_arn = aws_iam_policy.lambda_logging.arn
}
