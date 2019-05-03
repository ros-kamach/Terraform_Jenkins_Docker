provider "google" {
  credentials = "${file(var.credential_filepath)}"
  project     = "${var.gcp_project_id}"
  region      = "${var.project_region}"
}