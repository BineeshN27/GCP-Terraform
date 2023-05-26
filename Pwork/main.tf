########## Assign Project ID#############
data "google_project" "project_name" {
  project_id = "gcp-terraform-learning-387818"
}

########### Enable APIs ##################

module "enable_apis" {
  source                     = "./modules/enable-apis"
  project_id                 = data.google_project.project_name.project_id
  apis                       = var.apis
  disable_dependent_services = var.disable_dependent_services

}

############## Create Service Account ############
module "create_service_account" {
  source = "./modules/service-account"
  service_account = var.service_account
  project_id = data.google_project.project_name
  account_disabled = var.account_disabled
}

