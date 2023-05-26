variable "apis" {
  type        = list(string)
  description = "apis"
}

variable "project_id" {
  type        = string
  description = "project id"
}

variable "disable_dependent_services" {
  type        = bool
  description = "disable dependent service"
}

