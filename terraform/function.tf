resource "aws_iam_role" "execution_role" {
  name = "${local.function_name}-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "function" {
  depends_on = [
    aws_iam_role.execution_role,
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.function_log_group,
  ]
  function_name    = local.function_name
  filename         = local.filename
  handler          = "index.handler"
  runtime          = "nodejs12.x"
  source_code_hash = filebase64sha256(local.filename)
  role             = aws_iam_role.execution_role.arn

  environment {
    variables = {
      NODE_ENV = "production"
    }
  }
}
