variable "AWS_SELECTED_REGION" {}

variable "VPC_CIDR" {
  description = "Default CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "IPV4_CIDR_BLOCK" {
  default = "0.0.0.0/0"
}

variable "IPV6_CIDR_BLOCK" {
  default = "::/0"
}

# # Variables for iterative creations. Currently unused.
# variable "AZ_COUNT" {
#   default = "3"
# }

# variable "PUBLIC_SUBNET_CIDR" {
#   description = "Default CIDR block for Public Subnets"
#   type        = string
#   default     = "10.0.0.0/28"
# }

# variable "PRIVATE_SUBNET_CIDR" {
#   type        = string
#   description = "Default CIDR block for Private Subnets"
#   default     = "10.0.1.0/28"
# }
