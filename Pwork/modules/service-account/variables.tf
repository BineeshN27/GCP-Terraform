variable "service_account" {
    type = map(object({
        display_name = string
        description = string
        account_disabled = bool
    }))  
}

variable "project_id" {
  type = string
  description = "project id"
}
