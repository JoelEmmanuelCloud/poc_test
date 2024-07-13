resource "aws_lambda_function" "upload_function" {
  filename      = "lambda_upload.zip"
  function_name = "upload_function"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "upload.handler"
  runtime       = "python3.9"

  environment {
    variables = {
      BUCKET_NAME = module.s3_bucket.bucket_name
    }
  }

  source_code_hash = filebase64sha256("lambda_upload.zip")
}

resource "aws_lambda_function" "textract_function" {
  filename      = "lambda_textract.zip"
  function_name = "textract_function"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "textract.handler"
  runtime       = "python3.9"

  environment {
    variables = {
      BUCKET_NAME = module.s3_bucket.bucket_name
    }
  }

  source_code_hash = filebase64sha256("lambda_textract.zip")
}

resource "aws_lambda_function" "bedrock_function" {
  filename      = "lambda_bedrock.zip"
  function_name = "bedrock_function"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "bedrock.handler"
  runtime       = "python3.9"

  source_code_hash = filebase64sha256("lambda_bedrock.zip")
}
