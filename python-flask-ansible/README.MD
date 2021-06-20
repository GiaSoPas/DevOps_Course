# Ansible assignment
## Create and deploy your own service
### The development stage:
For the true enterprise grade system we will need Python3, Flask and emoji support. Why on Earth would we create stuff that does not support emoji?!

* the service listens at least on port 80 (443 as an option)
* the service accepts GET and POST methods
* the service should receive `JSON` object and return strings in the following manner:
```sh
curl -XPOST -d'{"animal":"cow", "sound":"moooo", "count": 3}' http://myvm.localhost/
cow says moooo
cow says moooo
cow says moooo
Made with ❤️ by %your_name

curl -XPOST -d'{"animal":"elephant", "sound":"whoooaaa", "count": 5}' http://myvm.localhost/
elephant says whoooaaa
elephant says whoooaaa
elephant says whoooaaa
elephant says whoooaaa
elephant says whoooaaa
Made with ❤️ by %your_name
```
* bonus points for being creative when serving `/`

### Hints
* [installing flask](https://flask.palletsprojects.com/en/1.1.x/installation/#installation)
* [become a developer](https://flask.palletsprojects.com/en/1.1.x/quickstart/)
* [or whatch some videos](https://www.youtube.com/watch?v=Tv6qXtc4Whs)
* [dealing with payloads](https://www.digitalocean.com/community/tutorials/processing-incoming-request-data-in-flask)
* [Flask documentation](https://flask.palletsprojects.com/en/1.1.x/api/#flask.Request.get_json)
* [The database](https://emojipedia.org/nature/)
* 🐘 🐮 🦒
* what would you expect to see when visiting a random unknown website?

### The operating stage:
* create an ansible playbook that deploys the service to the VM
* make sure all the components you need are installed and all the directories for the app are present
* configure systemd so that the application starts after reboot
* secure the VM so that our product is not stolen: allow connections only to the ports 22,80,443. Disable root login. Disable all authentication methods except 'public keys'.
* bonus points for SSL/HTTPS support with self-signed certificates
* bonus points for using ansible vault

### Requirements
* Debian 10
* VirtualBox VM

# My Task
_____
After you run the following two commands, you will have a fully running virtual machine in VirtualBox running.
Initialize Vagrant:
```sh
vagrant init generic/debian10
```
Start the virtual machine:
```sh
vagrant up
```
SSH into this machine, and explore your environment:
```sh
vagrant ssh
```
To start a playbook: 
```sh
./start
```
Things are happening in this script:
1. Ssh-keygen for creating new authentication key pairs for SSH
2. Using ssh-copy-id to install SSH keys on server
3. Run Ansible playbook, executing the defined tasks on the targeted hosts.

> The default location for inventory is a file /etc/ansible/hosts.

Things are happening in mytask.yml playbook:
1. Copy sshd file
2. Enable rules for ufw
3. Install flask, copy `main.py` in the target host
4. Copy, enable, start service file

Things are happening in sshd_config:
1. To only allow Public Key Authentication.
2. Disable SSH login for the root user.