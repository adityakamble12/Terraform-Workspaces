# S3 module:
module "s3_bucket" {
  source = "./modules/s3"

  bucket_name           = var.bucket_name
  status_versioning     = var.status_versioning
  logging_target_bucket = var.logging_target_bucket
  logging_target_prefix = var.logging_target_prefix

  #S3 Bucket Access Block
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  tags = var.tags
}


# RDS module:
module "aurora_db" {
  source = "./modules/rds"

  cluster_identifier        = var.cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  engine_mode               = var.engine_mode
  db_name                   = var.db_name
  master_username           = var.master_username
  master_password           = var.master_password
  final_snapshot_identifier = var.final_snapshot_identifier
  skip_final_snapshot       = var.skip_final_snapshot
  backup_retention_period   = var.backup_retention_period
  deletion_protection       = var.deletion_protection
  auto_pause                = var.auto_pause
  max_capacity              = var.max_capacity
  min_capacity              = var.min_capacity
  seconds_until_auto_pause  = var.seconds_until_auto_pause
  timeout_action            = var.timeout_action
  enable_http_endpoint      = var.enable_http_endpoint
  subnet_ids                = var.subnet_ids
}


# cOGNITO module:
module "my_cognito" {
  source = "./modules/cognito"

  userpool_name            = var.userpool_name
  email_attribute_name     = var.email_attribute_name
  attribute_data_type      = var.attribute_data_type
  mutable_attribute        = var.mutable_attribute
  developer_only_attribute = var.developer_only_attribute
  email_sending_account    = var.email_sending_account
  auto_verified_attributes = var.auto_verified_attributes

  minimum_password_length          = var.minimum_password_length
  require_lowercase                = var.require_lowercase
  require_numbers                  = var.require_numbers
  require_symbols                  = var.require_symbols
  require_uppercase                = var.require_uppercase
  temporary_password_validity_days = var.temporary_password_validity_days

  username_attributes     = var.username_attributes
  case_sensitive_username = var.case_sensitive_username

  cognito_env_tags = var.cognito_env_tags

  client_name                   = var.client_name
  supported_identity_providers  = var.supported_identity_providers
  explicit_auth_flows           = var.explicit_auth_flows
  generate_secret               = var.generate_secret
  prevent_user_existence_errors = var.prevent_user_existence_errors
  token_validity_hours          = var.token_validity_hours

}


# API GATEWAY module:
module "my_apigateway" {
  source = "./modules/apigateway"

  api_name        = var.api_name
  api_description = var.api_description
  endpoint_type   = var.endpoint_type

  api_name_2                 = var.api_name_2
  api_description_2          = var.api_description_2
  protocol_type              = var.protocol_type
  route_selection_expression = var.route_selection_expression
  api_version                = var.api_version

}


#ALB module:
module "my_alb_asg" {
  source = "./modules/alb_asg"

  # Create Security Groups
  security_group_name = "${var.security_group_name}-sg"

  # Define ingress rules for HTTP
  http_ingress = var.http_ingress


  # Define ingress rules for HTTPS   (need to comment before running)
  #https_ingress = var.https_ingress


  # Define outbound traffic rules
  outbound_traffic = var.outbound_traffic

  # Create Application Load Balancer
  loadbalancer_name = var.loadbalancer_name
  alb_internal      = var.alb_internal
  alb_type          = var.alb_type
  ip_address_type   = var.ip_address_type
  alb_subnets       = var.alb_subnets


  # Create Target Group
  target_group_name     = var.target_group_name
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  vpc_id                = var.vpc_id

  target_group_health_check_enabled             = var.target_group_health_check_enabled
  target_group_health_check_protocol            = var.target_group_health_check_protocol
  target_group_health_check_port                = var.target_group_health_check_port
  target_group_health_check_path                = var.target_group_health_check_path
  target_group_health_check_interval            = var.target_group_health_check_interval
  target_group_health_check_timeout             = var.target_group_health_check_timeout
  target_group_health_check_healthy_threshold   = var.target_group_health_check_healthy_threshold
  target_group_health_check_unhealthy_threshold = var.target_group_health_check_unhealthy_threshold
  target_group_health_check_success_codes       = var.target_group_health_check_success_codes

  # Tags for the target group
  target_group_tags = var.target_group_tags


  # Register targets (instances or Lambda functions) with the Target Group   (need to comment before running)
  #instance_ip         = var.instance_ip
  #instance_port       = var.instance_port
  #lambda_function_arn = var.lambda_function_arn
  #lambda_port         = var.lambda_port


  # Create Listeners and Routing
  listener_port       = var.listener_port
  listener_protocol   = var.listener_protocol
  default_action_type = var.default_action_type


  #https_listener_port       = var.https_listener_port
  #https_listener_protocol   = var.https_listener_protocol
  #https_default_action_type = var.https_default_action_type


  # Create Launch Template
  launch_template_name = var.launch_template_name
  device_name          = var.device_name
  volume_size          = var.volume_size
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnets              = var.alb_subnets

  # Create Auto Scaling Group
  asg_name                  = var.asg_name
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  launch_template_version   = var.launch_template_version

  # Define your tags
  tags = var.tags

  # Propagate at launch
  propagate_at_launch = var.propagate_at_launch

  cloudwatch_enabled_metrics = var.cloudwatch_enabled_metrics
}