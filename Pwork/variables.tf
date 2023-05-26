########### Enable APIs ##################
variable "apis" {
    type = list(string)
    description = "apis"
  
}

variable "disable_dependent_services" {
  type = string
  description = "disable_dependent_services"
}


