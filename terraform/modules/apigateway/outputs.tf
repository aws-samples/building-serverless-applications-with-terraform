output "greeting_api_endpoint" {
  value = "${aws_api_gateway_deployment.greeting_api_deployment.invoke_url}/greet"
}
