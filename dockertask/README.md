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