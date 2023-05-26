variable "compute_instance_without_static_ip" {
    type = map(object({
        name = string
        machine_type = string
        zone = string
        tags= list(string)
        image = string
        size = number
        labels= map(string)
        network = string
        subnetwork = string
        metadata = map(string)
        email = string
        scopes = list(string)      
    }))  
}

variable "project_id" {
  type = string
}
