backend "s3" {
  bucket         = var.S3_BUCKET
  key            = "state/terraform.tfstate"
  region         = var.AWS_DEFAULT_REGION
  dynamodb_table = var.DYNAMODB_TABLE_NAME
  encrypt        = true
}
