variable "env" {
  type = string
}

############################################# Lambda 
variable "function_name" {
  type = string
}

variable "function_handler" {
  type = string
}

variable "function_timeout" {
  type    = string
  default = "3"
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "function_runtime" {
  type = string
}

variable "use_vpc" {
  type    = bool
  default = false
}

variable "function_vpc_subnet_id_list" {
  type    = list(any)
  default = []
}

variable "function_security_group_id_list" {
  type    = list(any)
  default = []
}

variable "is_listening_to_sqs" {
  type    = bool
  default = false
}

variable "listening_sqs_arn" {
  type    = string
  default = ""
}

variable "is_triggered_by_alb" {
  type    = bool
  default = false
}










###variable "is_triggered_by_s3" {
###  type    = bool
###  default = false
###}
###
###variable "triggering_bucket_id" {
###  type    = string
###  default = ""
###}



############################################ SQS 
variable "queue_name" {
  type = string
}

variable "visibility_timeout_seconds" {
  type = number
}

variable "receive_wait_time_seconds" {
  type    = number
  default = 0
}

variable "account_id" {
  type    = string
  default = ""
}

variable "region" {
  description = "The AWS region where resources will be provisioned."
  default     = "us-east-1"
}

variable "use_DLQ" {
  type    = bool
  default = false
}

variable "DLQqueue_name" {
  type    = string
  default = ""
}

variable "is_subscribed_to_sns" {
  type    = bool
  default = false
}


####################################################################################################S

variable "subscribing_sns_topic_name" {
  type    = string
  default = ""
}

variable "subscribing_sns_topic_arn" {
  type    = string
  default = ""
}

variable "retention_period" {
  description = "Time (in seconds) that messages will remain in queue before being purged"
  type        = number
  default     = 86400
}

variable "receive_count" {
  description = "The number of times that a message can be retrieved before being moved to the dead-letter queue"
  type        = number
  default     = 3
}


#variable "aws_region" {
#  description = "The AWS region where resources will be provisioned."
#  default     = "us-east-1"
#}
#
#variable "sqs_queue_name" {
#  description = "The name of the SQS queue."
#  default     = "my-ephemeral-queue"
#}
#
#variable "sqs_delay_seconds" {
#  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
#  default     = 0
#}
#
#variable "sqs_max_message_size" {
#  description = "The maximum size of the messages that the queue can store, in bytes."
#  default     = 262144
#}
#
#variable "sqs_message_retention_seconds" {
#  description = "The number of seconds Amazon SQS retains a message."
#  default     = 345600  # 4 days
#}
#
#variable "lambda_function_name" {
#  description = "The name of the Lambda function."
#  default     = "my-ephemeral-lambda"
#}
#
#variable "lambda_handler" {
#  description = "The name of the function (within your code) that Lambda calls to start execution."
#  default     = "lambda_function.lambda_handler"
#}
#
#variable "lambda_runtime" {
#  description = "The runtime environment for the Lambda function."
#  default     = "python3.8"
#}
#
#variable "lambda_execution_role_arn" {
#  description = "The ARN of the IAM role that AWS Lambda assumes when it executes your function."
#  default     = "arn:aws:iam::407978873170:role/AWSLambdaBasicExecutionRole"
#}
#
#variable "lambda_zip_file_path" {
#  description = "The local path to the deployment package of your Lambda function."
#  default     = "../tf/lambda_function_payload.zip"
#}
#
