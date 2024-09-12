#!/bin/bash

# Ejecutar playbook del bastion
ansible-playbook -i inventory/hosts.yml playbooks/bastion_setup.yml

# Ejecutar playbooks de frontend y backend
ansible-playbook -i inventory/hosts.yml playbooks/frontend_setup.yml
ansible-playbook -i inventory/hosts.yml playbooks/backend_setup.yml