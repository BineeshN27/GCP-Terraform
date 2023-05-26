resource "google_project_service" "project_services" {
  for_each                   = var.apis
  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = var.disable_dependent_services
}