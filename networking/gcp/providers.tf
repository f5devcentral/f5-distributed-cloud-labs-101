terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      #      version = "3.64.0"
    }
  }
}

provider "google" {
  # Configuration options
  region  = var.region
  project = var.project
}