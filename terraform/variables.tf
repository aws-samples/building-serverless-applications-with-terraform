// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "environment" {
  type = string
  default = "production"
}

variable "lambda_memory_size" {
  type = number
  default = 1024
}
