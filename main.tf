//Cloud Provider Google

provider "google" {
credentials = ("devops-key.json")
project = var.project
region = var.region
}

//network Configuration

resource "google_compute_network" "devops-vpc"{
name = "devops-vpc"
auto_create_subnetworks = "true"
routing_mode = "GLOBAL"
}

// Compute Configuration

resource "google_compute_instance" "devops-vm" {
  name = "devops-vm"
  machine_type = "f1-micro"
  zone = var.zone
  
  boot_disk {
    initialize_params {
    image = "debian-cloud/debian-9"
  }
  }
  
  network_interface {
    network = var.network
	access_config {
	}
  }
}  