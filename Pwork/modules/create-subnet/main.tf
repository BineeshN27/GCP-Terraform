resource "google_compute_subnetwork" "subnet-use1" {
  for_each = var.subnet
  name          = each.key
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = var.network
  private_ip_google_access = each.value.private_ip_google_access 

  log_config {
    aggregation_interval = each.value.aggregation_interval
    flow_sampling        = each.value.flow_sampling
    metadata             = each.value.metadata
  }
}


