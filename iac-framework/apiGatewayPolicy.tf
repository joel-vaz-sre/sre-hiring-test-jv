
data "aws_iam_policy_document" "aircall_resize_apiGateway_policy_json" {
    statement {
        actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:PutLogEvents",
        "logs:GetLogEvents",
        "logs:FilterLogEvents"
        ]
        effect = "Allow"
        resources = [
        "arn:aws:logs:*:*:*"
        ]
    }

    statement {
        actions = [
        "apigateway:*",
        ]
        effect = "Allow"
        resources = [
        "arn:aws:apigateway:*::/*",
        ]
    }
}

resource "aws_iam_policy" "aircall_resize_apiGateway_policy" {
    name   = "aircall-image-resizer-apiGateway-log-policy"
    policy = data.aws_iam_policy_document.aircall_resize_apiGateway_policy_json.json
}

resource "aws_iam_role_policy_attachment" "aircall_resize_apiGateway_policy" {
    role       = aws_iam_role.iam_for_apiGateway.name
    policy_arn = aws_iam_policy.aircall_resize_apiGateway_policy.arn
}
