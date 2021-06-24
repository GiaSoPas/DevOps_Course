# Docker Task
____

A task:
- package your Python application into a minimal size docker container
- write a README.md explaining how to create and run a container 

Requirements:
* the result of the assembly must be an image not exceeding 100MB
* application must listen on port 8080
* request `curl -d '{" animal ":" cow "," sound ":" moooo "," count ": 3}' http: // localhost: 8080 /` should return the expected response
* the directory with the task should contain only the files required for the build and README.md
* only `docker build` and / or` docker-compose` are allowed 

Links:
* [Julia Evans blog](https://jvns.ca/)
* [Julia Evans wizardzines](https://wizardzines.com/)
* [Jessie Frazelle blog/links to talks](https://blog.jessfraz.com/post/talks/#2018)
* [Jessie Frazelle dockerfiles repo](https://github.com/jessfraz/dockerfiles)
* [random guys, bocker project](https://github.com/p8952/bocker)

## My Implementation
____

After you run the following two commands, you will have a fully running virtual machine in VirtualBox running.
Initialize Vagrant:
```sh
vagrant init hashicorp/bionic64
```
Start the virtual machine:
```sh
vagrant up
```
SSH into this machine, and explore your environment:
```sh
vagrant ssh
```
Build an image from a Dockerfile:
```sh
docker build -t flaskapp .
```
The `docker run` command creates a container from a given image and starts the container:
```sh
docker run --rm -dp 8080:8080 --name conflask flaskapp
```
Example:
```
curl -d '{"animal":"cow","sound":"moooo","count": 3}' http://127.17.0.2:8080
cow says moooo
cow says moooo
cow says moooo
Made with love by Ivan Ulitin
```
Stop running container:
```sh
docker stop contflask
```