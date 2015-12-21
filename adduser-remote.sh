#!/bin/bash

ansible-playbook -vvvv adduser-remote.yml --extra-vars "ansible_ssh_user=aerus" -kK
