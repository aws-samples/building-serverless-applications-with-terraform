// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

output "greeting_queue_arn" {
  value = aws_sqs_queue.greeting_queue.arn
}

output "greeting_queue_name" {
  value = aws_sqs_queue.greeting_queue.name
}
