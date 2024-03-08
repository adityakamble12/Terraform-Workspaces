#s3:

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "status_versioning" {
  description = "Enable versioning for the bucket"
  type        = string
}

variable "logging_target_bucket" {
  description = "Bucket to store access logs"
  type        = string
}

variable "logging_target_prefix" {
  description = "Prefix for access logs in the target bucket"
  type        = string
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
}

variable "block_public_acls" {
  description = "Controls whether Amazon S3 should block public ACLs for this bucket"
  type        = bool
}

variable "block_public_policy" {
  description = "Controls whether Amazon S3 should block public bucket policies for this bucket"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Controls whether Amazon S3 should ignore public ACLs for this bucket"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Controls whether Amazon S3 should restrict public bucket policies for this bucket"
  type        = bool
}


#rds:

variable "cluster_identifier" {
  description = "The identifier for the Aurora cluster"
  type        = string
}

variable "engine" {
  description = "The database engine type"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "engine_mode" {
  description = "The engine mode for the database"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
}

variable "master_password" {
  description = "The master password for the database"
  type        = string
}

variable "final_snapshot_identifier" {
  description = "The final snapshot identifier for the database"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Boolean to skip final snapshot"
  type        = bool
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "auto_pause" {
  description = "Enable auto pause"
  type        = bool
}

variable "max_capacity" {
  description = "Maximum capacity of the cluster"
  type        = number
}

variable "min_capacity" {
  description = "Minimum capacity of the cluster"
  type        = number
}

variable "seconds_until_auto_pause" {
  description = "Seconds until auto pause"
  type        = number
}

variable "timeout_action" {
  description = "Timeout action"
  type        = string
}

variable "enable_http_endpoint" {
  description = "Enable HTTP endpoint"
  type        = bool
}

variable "subnet_ids" {
  description = "List of subnet IDs where the Aurora cluster will be deployed"
  type        = list(string)
}


#cognito:

variable "userpool_name" {
  description = "Name of the Cognito user pool"
  type        = string
}

variable "email_attribute_name" {
  description = "Name of the email attribute"
  type        = string
}

variable "attribute_data_type" {
  description = "Data type of the attribute"
  type        = string
}

variable "mutable_attribute" {
  description = "Whether the attribute is mutable or not"
  type        = bool
}

variable "developer_only_attribute" {
  description = "Whether the attribute is for developers only"
  type        = bool
}

variable "email_sending_account" {
  description = "Email sending account for configuration"
  type        = string
}

variable "auto_verified_attributes" {
  description = "List of auto-verified attributes"
  type        = list(string)
}

variable "minimum_password_length" {
  description = "Minimum length for user passwords"
  type        = number
}

variable "require_lowercase" {
  description = "Require at least one lowercase letter in the password"
  type        = bool
}

variable "require_numbers" {
  description = "Require at least one number in the password"
  type        = bool
}

variable "require_symbols" {
  description = "Require at least one symbol in the password"
  type        = bool
}

variable "require_uppercase" {
  description = "Require at least one uppercase letter in the password"
  type        = bool
}

variable "temporary_password_validity_days" {
  description = "Validity period for temporary passwords in days"
  type        = number
}

variable "username_attributes" {
  description = "Attributes used as the username"
  type        = list(string)
}

variable "case_sensitive_username" {
  description = "Is the username case-sensitive"
  type        = bool
}

variable "cognito_env_tags" {
  description = "Tags to be applied to the Cognito user pool"
  type        = map(string)
}

variable "client_name" {
  description = "Name of the Cognito user pool client"
  type        = string
}

variable "supported_identity_providers" {
  description = "List of supported identity providers"
  type        = list(string)
}

variable "explicit_auth_flows" {
  description = "List of explicit authentication flows"
  type        = list(string)
}

variable "generate_secret" {
  description = "Specifies whether to generate a client secret"
  type        = bool
}

variable "prevent_user_existence_errors" {
  description = "Behavior if a user with the same username exists"
  type        = string
}

variable "token_validity_hours" {
  description = "Validity period for tokens in hours"
  type        = number
}


#api gateway:

variable "api_name" {
  description = "Name of the REST API"
  type        = string
}

variable "api_description" {
  description = "Description of the REST API"
  type        = string
}

variable "endpoint_type" {
  description = "Type of endpoint for the REST API"
  type        = string
}

variable "api_name_2" {
  description = "Name of the WebSocket API"
  type        = string
}

variable "api_description_2" {
  description = "Description of the WebSocket API"
  type        = string
}

variable "protocol_type" {
  description = "Protocol type for the WebSocket API"
  type        = string
}

variable "route_selection_expression" {
  description = "Route selection expression for the WebSocket API"
  type        = string
}

variable "api_version" {
  description = "Version of the WebSocket API"
  type        = string
}


#alb-asg:

variable "security_group_name" {
  description = "Name of the security group for the Application Load Balancer"
  type        = string
}

variable "http_ingress" {
  description = "Ingress rules for HTTP"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

/*
variable "https_ingress" {
  description = "Ingress rules for HTTPS"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
*/

variable "outbound_traffic" {
  description = "Outbound traffic rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}



variable "loadbalancer_name" {
  description = "Name of the Application Load Balancer"
}

variable "alb_internal" {
  description = "Boolean flag for internal ALB"
  type        = bool
}

variable "alb_type" {
  description = "Type of the load balancer"
}

variable "ip_address_type" {
  description = "Type of IP addresses for the ALB (ipv4 or dualstack)"
}

variable "alb_subnets" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "target_group_name" {
  description = "Name of the Target Group"
}

variable "target_group_port" {
  description = "Port for the Target Group"
}

variable "target_group_protocol" {
  description = "Protocol for the Target Group"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "target_group_health_check_enabled" {
  description = "Enable or disable health checks for the target group"
  type        = bool
}

variable "target_group_health_check_protocol" {
  description = "Protocol to use for health checks (HTTP, HTTPS, TCP, SSL)"
  type        = string
}

variable "target_group_health_check_port" {
  description = "Port to use for health checks"
  type        = number
}

variable "target_group_health_check_path" {
  description = "Path to use for HTTP/HTTPS health checks"
  type        = string
}

variable "target_group_health_check_interval" {
  description = "Interval between health checks (in seconds)"
  type        = number
}

variable "target_group_health_check_timeout" {
  description = "Timeout for health checks (in seconds)"
  type        = number
}

variable "target_group_health_check_healthy_threshold" {
  description = "Number of consecutive successful health checks required to mark a target healthy"
  type        = number
}

variable "target_group_health_check_unhealthy_threshold" {
  description = "Number of consecutive failed health checks required to mark a target unhealthy"
  type        = number
}

variable "target_group_health_check_success_codes" {
  description = "HTTP codes considered as successful for health checks"
  type        = string
}

variable "target_group_tags" {
  description = "Tags for the target group"
  type        = map(string)
}

/*
variable "instance_ip" {
  description = "IP address of the instance to register with the target group"
}


variable "instance_port" {
  description = "Port for the instance"
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function to register with the target group"
}

variable "lambda_port" {
  description = "Port for the Lambda function"
}
*/


variable "listener_port" {
  description = "Port for the listener"
}

variable "listener_protocol" {
  description = "Protocol for the listener"
}

variable "default_action_type" {
  description = "Type for the default action"
}

/*
variable "https_listener_port" {
  description = "Port for the HTTPS listener"
}

variable "https_listener_protocol" {
  description = "Protocol for the HTTPS listener"
}

variable "https_default_action_type" {
  description = "Type for the default action of HTTPS listener"
}
*/


variable "launch_template_name" {
  description = "Name for the launch template"
}

variable "device_name" {
  description = "Device name for block device mapping"
}

variable "volume_size" {
  description = "Volume size for the EBS"
}

variable "ami_id" {
  description = "ID of the AMI to use for instances"
}

variable "instance_type" {
  description = "Type of EC2 instances"
}

variable "key_name" {
  description = "Name of the key pair"
}

variable "subnets" {
  description = "List of subnets to use for the Auto Scaling Group"
  type        = list(string)
}


variable "asg_name" {
  description = "Name of the Auto Scaling Group"
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group"
}

variable "max_size" {
  description = "Maximum size for the Auto Scaling Group"
}

variable "min_size" {
  description = "Minimum size for the Auto Scaling Group"
}

variable "health_check_type" {
  description = "Type of health check for the Auto Scaling Group"
}

variable "health_check_grace_period" {
  description = "Health check grace period for the Auto Scaling Group"
}

variable "launch_template_version" {
  description = "Version of the launch template"
}

variable "propagate_at_launch" {
  description = "Whether tags should be propagated to instances launched in the Auto Scaling Group"
  type        = bool
}

variable "cloudwatch_enabled_metrics" {
  description = "Enable or disable CloudWatch monitoring for Auto Scaling Group"
  type        = bool
}
