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
  source          = "./modules/service-account"
  service_account = var.service_account
  project_id      = data.google_project.project_name.project_id
}

############## Create VPC ############
module "create_vpc" {
  source                  = "./modules/create-vpc"
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks

}

############## Create Subnet ############
module "create_subnet" {
  source  = "./modules/create-subnet"
  subnet  = var.subnet
  network = var.vpc_name
}

############## vm-without-static-ip ############
module "vm_without_static_ip" {
  source                             = "./modules/vm-without-static-ip"
  compute_instance_without_static_ip = var.compute_instance_without_static_ip
  project_id                         = data.google_project.project_name.project_id
}

############## create static IPs ############

resource "google_compute_address" "compute_ips" {
count = 4
name = "static-ips-${count.index}"
#network = var.vpc_name
subnetwork = var.subnet.use1.name
address_type = "INTERNAL"
region = "us-east1"


}

############## vm-with-static-ip ############
module "vm_with_static_ip" {
  source                             = "./modules/vm-with-static-ip"
  compute_instance_with_static_ip = var.compute_instance_with_static_ip
  project_id                         = data.google_project.project_name.project_id
}

############## notification-channel ############
module "notification_channel" {
  source = "./modules/notification-channel"
  for_each = var.notification_channel
  display_name = each.key
  notification_type = each.value.notification_type
  force_delete = each.value.force_delete
  notification_labels = each.value.notification_labels
}
