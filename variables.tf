variable "os_image" {
  default = "centos-cloud/centos-7"
}
variable "os_type" {
  default = "n1-standard-1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "instance_name" {
  default = "ci"
}
variable "ssh_public_key_filepath" {
  description = "Filepath for ssh public key"
  type     = "string"
  default = "cred/ssh/id_rsa.pub"
}

variable "ssh_private_key_filepath" {
  description = "Filepath for ssh private key"
  type     = "string"
  default = "cred/ssh/id_rsa.pem"
}

variable "credential_filepath" {
  description = "Filepath for ssh public key"
  type     = "string"
  default = "cred/Jenkins-Docker-e7544e597aae.json"
}

variable "gcp_project_id" {
  description = "ID of my project"
  default = "jenkins-docker-238718"
}

variable "project_region" {
  default = "us-central1"
}
variable "network_cidr" {
  description = "Network Variables"
  default = "10.10.0.0/20"
}

variable "network_name" {
  description = "Network Name"
  default = "project-network"
}

variable "subnetwork_name" {
  description = "SubNetwork Name"
  default = "project-subnetwork"
}

variable "firewall_name" {
  description = "FIREWALL Variables"
  default = "tf-jenkins-firewall"
}

variable "workspace" {
  default = "/tmp"
}
