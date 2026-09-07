terraform {
    required_version = ">= 1.6.0"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket = "terraform-state-three-tier-architecture"
        key    = "terraform.tfstate"
        region = "ap-southeast-1"
        dynamodb_table = "terraform-state-three-tier-architecture"
        encrypt = true
    }
}