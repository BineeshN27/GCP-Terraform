terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.42.0"
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
