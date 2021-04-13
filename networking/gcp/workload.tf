# resource "google_service_account" "workload" {
#   account_id = "workloadserviceaccount"
# }
resource "google_compute_firewall" "workload" {
  name    = "${var.prefix}-workload"
  network = google_compute_network.internal.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","8080"]
  }

}
resource "google_compute_instance" "workload" {
  name         = "${var.prefix}-workload"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-1804-bionic-v20210413"
    }
  }


  network_interface {
    network = google_compute_network.internal.id
    subnetwork = google_compute_subnetwork.workload.id
    access_config {
      // Ephemeral IP
    }
  }


  metadata_startup_script = <<-EOF
#!/bin/bash
sleep 30
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d  --net=host --restart=always \
    -e F5DEMO_APP=text \
    -e F5DEMO_NODENAME='GCP Environment' \
    -e F5DEMO_COLOR=ffd734 \
    -e F5DEMO_NODENAME_SSL='GCP Environment (Backend App)' \
    -e F5DEMO_COLOR_SSL=a0bf37 \
       public.ecr.aws/y9n2y5q5/demos:openshift
              EOF

  # service_account {
  #   email  = google_service_account.workload.email
  #   scopes = ["cloud-platform"]
  # }
}