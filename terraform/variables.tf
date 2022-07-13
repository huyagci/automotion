variable "AWS_ACCESS_KEY" {
  sensitive = true
}

variable "AWS_SECRET_KEY" {
  sensitive = true
}

variable "AWS_DEFAULT_REGION" {
  default = "eu-central-1"
}

variable "AWS_DEFAULT_AMI" {
  default = "ami-052efd3df9dad4825"
}
