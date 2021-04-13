resource "google_compute_subnetwork" "external" {
  name          = "${var.prefix}-external"
  ip_cidr_range = "10.3.0.0/24"
  region        = var.region
  network       = google_compute_network.external.id
}

resource "google_compute_network" "external" {
  name                    = "${var.prefix}-external"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "internal" {
  name          = "${var.prefix}-internal"
  ip_cidr_range = "10.3.1.0/24"
  region        = var.region
  network       = google_compute_network.internal.id
}

resource "google_compute_network" "internal" {
  name                    = "${var.prefix}-internal"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "workload" {
  name          = "${var.prefix}-workload"
  ip_cidr_range = "10.3.2.0/24"
  region        = var.region
  network       = google_compute_network.internal.id
}


# resource "google_compute_route" "to_volterra_gw" {
#   name = "volterra-gw"
#   dest_range = "0.0.0.0/0"
#   network = google_compute_network.internal.id
#   next_hop_ip = "10.3.1.2"
#   priority = 1000
# }