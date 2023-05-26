variable "subnet" {
  type = map(object({
    name = string
    ip_cidr_range = string
    region = string
    aggregation_interval = string
    flow_sampling = number
    metadata = string
    private_ip_google_access = bool
  }))
}

variable "network" {
    type = string
}
