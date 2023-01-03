resource "aws_api_gateway_rest_api" "resize_RestAPI" {
    name = "aircall-resize-restAPI"
}

resource "aws_api_gateway_resource" "resize_api_resource" {
    parent_id   = aws_api_gateway_rest_api.resize_RestAPI.root_resource_id
    path_part   = "image"
    rest_api_id = aws_api_gateway_rest_api.resize_RestAPI.id
}

resource "aws_api_gateway_method" "resize_post_request" {
    authorization = "NONE"
    http_method   = "POST"
    resource_id   = aws_api_gateway_resource.resize_api_resource.id
    rest_api_id   = aws_api_gateway_rest_api.resize_RestAPI.id
}

resource "aws_api_gateway_integration" "resize_post_integration" {
    http_method = aws_api_gateway_method.resize_post_request.http_method
    resource_id = aws_api_gateway_resource.resize_api_resource.id
    rest_api_id = aws_api_gateway_rest_api.resize_RestAPI.id
    integration_http_method = "POST"
    type        = "AWS_PROXY"
    uri         = aws_lambda_function.aircall_image_resizer.invoke_arn
}

resource "aws_api_gateway_deployment" "resize_deployment" {
    stage_name  = "resize"
    rest_api_id = aws_api_gateway_rest_api.resize_RestAPI.id

    lifecycle {
        create_before_destroy = true
    }

    depends_on = [aws_api_gateway_method.resize_post_request, aws_api_gateway_integration.resize_post_integration]
}

resource "aws_api_gateway_usage_plan" "resize_usage_plan" {
    name = "aircall-image-resizer"

    api_stages {
        api_id = aws_api_gateway_rest_api.resize_RestAPI.id
        stage  = aws_api_gateway_deployment.resize_deployment.stage_name
    }
}

resource "aws_api_gateway_api_key" "resize_api_key" {
    name = "aircall-image-resizer-api-key"
}

resource "aws_api_gateway_usage_plan_key" "resize_usage_plan_key" {
    key_id        = aws_api_gateway_api_key.resize_api_key.id
    key_type      = "API_KEY"
    usage_plan_id = aws_api_gateway_usage_plan.resize_usage_plan.id
}
