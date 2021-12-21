variable "PRIVATE_SUBNET_1_ID" {
}

variable "PRIVATE_SUBNET_2_ID" {
}


variable "VPC_ID" {
}

variable "PREFERED_AZ" {
}

variable "ALLOWED_SG" {
  type        = list(string)
  description = "RDS allowed sg"
}
variable "RDS_PASSWORD" {
  default = "root"
}

