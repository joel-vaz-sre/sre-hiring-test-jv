
data "aws_iam_policy_document" "aircall_resize_lambda_policy_json" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:s3:::aircall-image-resize-bucket/*",
    ]
  }
}

resource "aws_iam_policy" "aircall_resize_lambda_policy" {
  name   = "aircall-image-resizer-lambda-log-policy"
  policy = data.aws_iam_policy_document.aircall_resize_lambda_policy_json.json
}

resource "aws_iam_role_policy_attachment" "aircall_resize_lambda_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.aircall_resize_lambda_policy.arn
}
