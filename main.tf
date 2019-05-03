  resource "google_compute_network" "vpc_network" {
    name = "${var.network_name}"
    auto_create_subnetworks = false
  }
resource "google_compute_subnetwork" "private_subnetwork" {
  name                     = "${var.subnetwork_name}"
  ip_cidr_range            = "${var.network_cidr}"
  network                  = "${google_compute_network.vpc_network.self_link}"
  region                   = "${var.project_region}"
  private_ip_google_access = true
}
resource "google_compute_firewall" "jenkins" {
  name    = "${var.firewall_name}"
  network = "${google_compute_network.vpc_network.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "8080", "7080", "6080"]
  }
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["jenkins"]
}

resource "google_compute_instance" "ci_jenkins" {
  name         = "${var.instance_name}"
  machine_type = "${var.os_type}"
  zone         = "${var.zone}"
  tags = ["jenkins", "ansible"]
  boot_disk {
    initialize_params {
      image = "${var.os_image}"
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.private_subnetwork.name}"
    access_config = {
      }
  }
    metadata {
      sshKeys = "centos:${file(var.ssh_public_key_filepath)}"
    }
  
#   metadata_startup_script = <<SCRIPT
# sudo yum -y update
# #Install ansible
# sudo yum -y install epel-release
# sudo yum -y install ansible
# sudo chmod +x ${var.workspace}/templates/provision.sh
# ${var.workspace}/templates/provision.sh
# SCRIPT
}