#!/bin/bash
# Install update all
sudo yum install epel-release -y
sudo yum update -y
# Installing Ansible
sudo yum install ansible -y
sudo cat <<EOF | sudo tee -a /etc/ansible/ansible.cfg
[defaults]
host_key_checking = false
inventory = /home/centos/hosts.txt
ssh_args = -o ControlMaster=auto -o ControlPersist=60s -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes
EOF
sudo cat <<EOF | sudo tee -a /home/centos/hosts.txt
localhost ansible_connection=local
EOF
sudo ansible-playbook /tmp/ansible/main.yml