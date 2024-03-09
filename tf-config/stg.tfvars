env    = "stg"
region = "us-east-1"
######################################## Lambda Variables
function_name       = "eeprGHPRNO-gl-stg-lambda"
function_handler    = "lambda_function.lambda_handler"
function_timeout    = 120
memory_size         = 128
function_runtime    = "python3.10"
is_listening_to_sqs = true

######################################## SQS Variables
queue_name                 = "eeprGHPRNO-gl-stg-sqs.fifo" #
visibility_timeout_seconds = 120
use_DLQ                    = true
DLQqueue_name              = "eeprGHPRNO-gl-stg-dlq.fifo"#
is_subscribed_to_sns       = false
#########################################


########################################## VPC Variables
vpc_cidr             = "10.8.0.0/19"
vpc_name             = "btech-retail-test-vpc"
private_subnet_cidrs = ["10.8.0.0/22", "10.8.4.0/22", "10.8.8.0/22", "10.8.24.0/25", "10.8.24.128/25", "10.8.25.0/25" ]
public_subnet_cidrs  = ["10.8.26.0/25", "10.8.25.128/25"]
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

## ######################################## Security-Group Variables
ec2_sg_sg_name     = "bastion-sg"
ec2_sg_allowed_ips = ["10.8.1.0/24", "41.187.108.130/32", "196.219.245.74/32", "196.219.45.50/32", "196.204.32.226/32", "84.36.24.98/32", "41.33.160.241/32"]

rds_sg_name        = "rds-sg"
rds_sg_allowed_ips = ["10.8.2.0/24"]

alb_sg_name        = "alb-sg"
alb_sg_allowed_ips = ["10.8.1.0/24", "41.187.108.130/32", "196.219.245.74/32", "196.219.45.50/32", "196.204.32.226/32", "84.36.24.98/32", "41.33.160.241/32"]

eks_sg_name = "eks-sg"

########################################## EKS Variables
cluster_name    = "btech-retail-test-eks"
cluster_version = "1.28"
profile_name    = "btech-retail-test-eks"

########################################## EKS-NodeGroup Variables
node_group_name           = "btech-retail-test-eks-node-group"
node_group_min_size       = 1
node_group_desired_size   = 1
node_group_max_size       = 2
node_group_capacity_type  = "ON_DEMAND"
node_group_disk_size      = 30
node_group_instance_types = ["t3.large"]

########################################### EKS-Addon Variables
ingress_group_name     = "retial-stg"           ###########
argo_cd_lb_domain_name = "rtstgargo.btechlabs.io"  ###########

########################################## ACM Variables
#acm_domain_name = "btechlabs.io"
#
######################################### EC2 Variables
instance_name             = "btech-retail-stg-bastion"
instance_type             = "t3.micro"
instance_root_volume_size = 10
allow_eks_access          = true
#
######################################### SSH-KEY Variables
key_name         = "btech-retail-stg-bastion-sshkey"

######################################### RDS Variables
##--------------------------------- RDS-1
rds1_identifier              = "gl-scheduling-stg-rds"
rds1_engine_version          = "14.6"
rds1_db_username             = "retailstg"
rds1_database_name           = "postgres"
rds1_backup_retention_period = 7
rds1_skip_final_snapshot     = true
#rds1_serverless_min_capacity = 0.5
rds1_serverless_max_capacity = 5
rds1_secret_name             = "gl-scheduling-stg-rds-ssm"
rds1_instance_count          = 1
rds1_instance_class          = "db.serverless"
rds1_publicly_accessible     = false

#--------------------------------- RDS-2
rds2_identifier              = "gl-notifications-stg-rds"
rds2_engine_version          = "14.6"
rds2_db_username             = "retailstg"
rds2_database_name           = "postgres"
#rds2_backup_retention_period = 7
rds2_skip_final_snapshot     = true
rds2_serverless_min_capacity = 0.5
rds2_serverless_max_capacity = 5
rds2_secret_name             = "gl-notifications-stg-rds-ssm"
rds2_instance_count          = 1
rds2_instance_class          = "db.serverless"
rds2_publicly_accessible     = false

#
######################################### RDS subnet group Variables
db_subnet_group_name         = "stg-subnet-group"

######################################### ECR Variables
#ecr_execution_name  = "gl-execution-stg-ecr"
#ecr_scheduling_name = "gl-scheduling-stg-ecr"


