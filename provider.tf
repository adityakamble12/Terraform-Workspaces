terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "s3" {
    #Remote Backend:

    region = "us-east-2"

    #S3 Bucket name that we have created:
    bucket = "mera-terra-state-tf"

    #State file location on S3
    key = "tf-state/terraform.tfstate"

    #State-Locking
    #DynamoDB table name that we have created:
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["/var/lib/jenkins/.aws/config"]
  shared_credentials_files = ["/var/lib/jenkins/.aws/credentials"]
  profile                  = "default"
}
