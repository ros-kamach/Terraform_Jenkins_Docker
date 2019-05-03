 output "external_ip" {
 description = "description"
 value = ["${google_compute_instance.ci_jenkins.network_interface.0.access_config.0.nat_ip}"]
}