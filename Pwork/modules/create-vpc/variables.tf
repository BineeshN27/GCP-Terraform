variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to automatically create subnetworks in the VPC."
  type        = bool
}