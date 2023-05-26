terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.66.0"
    }
  }


  cloud {
    organization = "bineeshn"
    hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io
    workspaces {
      name = "GCP-Terraform-Learning"
    }
  }
}


provider "google" {
  # Configuration options
  project = "gcp-terraform-learning-387818"
}
