variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "dummy_var" {
  default = "dummy var"
}

# variable "AMI" {
#   default = data.aws_ami.ubuntu.id
# }
