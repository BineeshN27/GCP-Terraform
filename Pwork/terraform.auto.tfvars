########### Enable APIs ##################
apis                       = ["cloudresourcemanager.googleapis.com", "pubsub.googleapis.com", "cloudfunctions.googleapis.com", "iam.googleapis.com"]
disable_dependent_services = true

############## Create Service Account ############
service_account = {
  "sa-vm-pwork" = {
    display_name     = "sa-vm-pwork"
    description      = "Service account used by VMs in this project"
    account_disabled = false
  }
}

############## Create VPC ############
vpc_name                = "gcp-terraform-learning"
auto_create_subnetworks = false

############## Create Subnet ############
subnet = {
  "use1" = {
    name                     = "use1"
    ip_cidr_range            = "10.0.0.0/24"
    region                   = "us-east1"
    aggregation_interval     = "INTERVAL_10_MIN"
    flow_sampling            = 0.5
    metadata                 = "INCLUDE_ALL_METADATA"
    private_ip_google_access = true
  }

  "usc1" = {
    name                     = "usc1"
    ip_cidr_range            = "10.10.0.0/24"
    region                   = "us-central1"
    aggregation_interval     = "INTERVAL_10_MIN"
    flow_sampling            = 0.5
    metadata                 = "INCLUDE_ALL_METADATA"
    private_ip_google_access = true
  }
}

############## vm-without-static-ip ############
compute_instance_without_static_ip = {
  "vm-no-static-ip-1" = {
    name         = "vm-no-static-ip-1"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    tags         = ["test-server", "frontend"]
    image        = "ubuntu-2004-focal-arm64-v20230523"
    size         = 10
    labels = {
      environement = "test"
      os           = "ubuntu-focal"
    }
    network    = "gcp-terraform-learning"
    subnetwork = "use1"
    metadata = {

    }
    email = "sa-vm-pwork@gcp-terraform-learning-387818.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }
}

############## vm-with-static-ip ############
compute_instance_with_static_ip = {
  "vm-static-ip-1" = {
    name         = "vm-static-ip-1"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    network_ip   = "10.0.0.5" 
    tags         = ["test-server", "frontend"]
    image        = "ubuntu-2004-focal-arm64-v20230523"
    size         = 10
    labels = {
      environement = "test"
      os           = "ubuntu-focal"
    }
    network    = "gcp-terraform-learning"
    subnetwork = "use1"
    metadata = {

    }
    email = "sa-vm-pwork@gcp-terraform-learning-387818.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }

  "vm-static-ip-2" = {
    name         = "vm-static-ip-2"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    network_ip   = "10.0.0.6" 
    tags         = ["test-server", "frontend"]
    image        = "ubuntu-2004-focal-arm64-v20230523"
    size         = 10
    labels = {
      environement = "test"
      os           = "ubuntu-focal"
    }
    network    = "gcp-terraform-learning"
    subnetwork = "use1"
    metadata = {

    }
    email = "sa-vm-pwork@gcp-terraform-learning-387818.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }

  "vm-static-ip-3" = {
    name         = "vm-static-ip-3"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    network_ip   = "10.0.0.7" 
    tags         = ["test-server", "frontend"]
    image        = "ubuntu-2004-focal-arm64-v20230523"
    size         = 10
    labels = {
      environement = "test"
      os           = "ubuntu-focal"
    }
    network    = "gcp-terraform-learning"
    subnetwork = "use1"
    metadata = {

    }
    email = "sa-vm-pwork@gcp-terraform-learning-387818.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }

  "vm-static-ip-4" = {
    name         = "vm-static-ip-4"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    network_ip   = "10.0.0.8" 
    tags         = ["test-server", "frontend"]
    image        = "ubuntu-2004-focal-arm64-v20230523"
    size         = 10
    labels = {
      environement = "test"
      os           = "ubuntu-focal"
    }
    network    = "gcp-terraform-learning"
    subnetwork = "use1"
    metadata = {

    }
    email = "sa-vm-pwork@gcp-terraform-learning-387818.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }
}


############## notification-channel ############

notification_channel = {
  "notification_channel_1" = {
    notification_type = "email"
    force_delete = true
    notification_labels = {email_address = "testmail1@gmail.com"}
  }

   "notification_channel_2" = {
    notification_type = "email"
    force_delete = true
    notification_labels = {email_address = "testmail2@gmail.com"}
  }
}

