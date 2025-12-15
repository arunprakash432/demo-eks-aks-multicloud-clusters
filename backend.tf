terraform {
    backend "s3" {
        bucket = "multi-cloud-terraform-state-123456"
        key = "prod/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-locks"
        encrypt = true
    }
}