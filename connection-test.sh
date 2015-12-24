#!/bin/bash

ansible test-vm -m ping --extra-vars "ansible_ssh_user=sergii_danylin@epam.com" -kK
