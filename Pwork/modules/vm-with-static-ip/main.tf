resource "google_compute_instance" "compute_instance_with_static_ip" {
  for_each = var.compute_instance_with_static_ip
  project = var.project_id
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  

  tags = each.value.tags 
  labels = each.value.labels

  boot_disk {
    initialize_params {
      image = each.value.image 
      size  = each.value.size          
      }
    }


  # // Local SSD disk
  # scratch_disk {
  #   interface = "SCSI"
  # }

  network_interface {
    network = each.value.network
    subnetwork = each.value.subnetwork
    network_ip   = each.value.network_ip
  }

  metadata = each.value.metadata 

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = each.value.email
    scopes = each.value.scopes 
  }
}