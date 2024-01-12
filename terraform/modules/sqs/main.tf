// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_sqs_queue" "greeting_queue" {
  name                    = "greetings_queue"
  sqs_managed_sse_enabled = true
  
  tags = {
    environment: var.tag_environment
  }
}

