########## Assign Project ID#############
data "google_project" "current_project" {
  project_id = "gcp-terraform-learning-387818"
}

########### Enable APIs ##################

module "enable_apis" {
  source                     = "./modules/enable-apis"
  project_id                 = data.google_project.current_project.project_id
  apis                       = var.apis
  disable_dependent_services = var.disable_dependent_services

}
