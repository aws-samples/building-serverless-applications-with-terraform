// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

output "greeting_api_endpoint" {
  value = "${aws_api_gateway_deployment.greeting_api_deployment.invoke_url}/greet"
}
