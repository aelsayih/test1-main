data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

terraform {
  backend "s3" {
    bucket = "eph-env-test-s3"
    key    = "eeprGHPRNO-tfstate"
    region = "us-east-1"
  }
}

######################################### LAMBDA
module "aws-lambda" {
  source           = "../modules/lambda/lambda_zip_file"
  env              = var.env
  function_name    = var.function_name
  function_handler = var.function_handler
  function_timeout = var.function_timeout
  memory_size      = var.memory_size
  function_runtime = var.function_runtime
  use_vpc          = true
  #function_vpc_subnet_id_list     = [module.vpc.public_subnet_ids[2]] might be needed in RDS
  #function_security_group_id_list = [module.rds_sg.security_group_id] in case of RDS
  is_listening_to_sqs = var.is_listening_to_sqs
  listening_sqs_arn   = module.aws-sqs.queue_arn
  is_triggered_by_alb = var.is_triggered_by_alb
}

######################################### SQS
module "aws-sqs" {
  env                        = var.env
  source                     = "../modules/sqs"
  queue_name                 = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  account_id                 = local.account_id
  region                     = var.region
  use_DLQ                    = var.use_DLQ
  DLQqueue_name              = var.DLQqueue_name
  is_subscribed_to_sns       = var.is_subscribed_to_sns
  usefifo                    = true
}
