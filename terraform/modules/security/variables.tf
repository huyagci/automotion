
variable "ipv4_cidr_block" {
  default = "0.0.0.0/0"
}

variable "ipv6_cidr_block" {
  default = "::/0"
}

variable "VPC_ID" {
  type = string
}
