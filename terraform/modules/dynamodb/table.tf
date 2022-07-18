# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table

# Required for terraform state locking.
resource "aws_dynamodb_table" "dynamodb_table" {
  name = "tf-state-lock"
  # PAY_PER REQUEST is not free tier eligible. Default is PROVISIONED.
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
