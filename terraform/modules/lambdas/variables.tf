// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "src_bucket_arn" {
    type = string
}

variable "dst_bucket_arn" {
    type = string
}

variable "src_bucket_id" {
    type = string
}

variable "dst_bucket_id" {
    type = string
}

variable "greeting_queue_arn" {
    type = string
}

variable "lambda_memory_size" {
    type = number
}

variable "tag_environment" {
  type = string
}

