# AWS Config

variable "aws_access_key" {
  type    = "string"
  default = "AWS_ACCESS_KEY"
}

variable "aws_secret_key" {
  type    = "string"
  default = "AWS_SECRET_KEY"
}

variable "aws_region" {
  type    = "string"
  default = "eu-west-1"
}

variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}

variable "key_name" {
  type    = "string"
  default = "KEY_NAME"
}

