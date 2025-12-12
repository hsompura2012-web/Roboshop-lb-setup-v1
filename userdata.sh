#! /bin/bash
sudo dnf install python3.13-pip -y
sudo pip3.11 install ansible
ansible-pull -i localhost, -U https://github.com/hsompura2012-web/Practice-Ansible-template-V1.git main.yaml -e component=${component} -e env=${env}