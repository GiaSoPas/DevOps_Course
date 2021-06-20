#!/bin/bash

ip=$(cat /etc/ansible/hosts | grep ansible_host | awk -F'=' '{print $2}')

user=$(cat /etc/ansible/hosts | grep ansible_user| awk -F'=' '{print $2}')

ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null

ssh-copy-id -i  ~/.ssh/id_rsa.pub "$user"@"$ip"

ansible-playbook mytask.yml -vvv
