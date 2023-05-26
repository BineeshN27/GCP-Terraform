########### Enable APIs ##################
variable "apis" {
  type        = list(string)
  description = "apis"

}

variable "disable_dependent_services" {
  type        = string
  description = "disable_dependent_services"
}

############## Create Service Account ############
variable "service_account" {
  type = map(object({
    display_name     = string
    description      = string
    account_disabled = bool
  }))
}

############## Create VPC ############
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to automatically create subnetworks in the VPC."
  type        = bool
}

############## Create Subnet ############
variable "subnet" {
  type = map(object({
    name                     = string
    ip_cidr_range            = string
    region                   = string
    aggregation_interval     = string
    flow_sampling            = number
    metadata                 = string
    private_ip_google_access = bool
  }))
}

############## vm-without-static-ip ############
variable "compute_instance_without_static_ip" {
  type = map(object({
    name         = string
    machine_type = string
    zone         = string
    tags         = list(string)
    image        = string
    size         = number
    labels       = map(string)
    network      = string
    subnetwork   = string
    metadata     = map(string)
    email        = string
    scopes       = list(string)
  }))
}



