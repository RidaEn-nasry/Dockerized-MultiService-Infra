
# REMEMBER:
    - match login.fr.42 using docker dns not by modify host 
    -  reasearch hands and really get into nginx
     
# Docker

The conclusion **Docker is all about process isolation.**

Docker is a clever use of OS-level virtualization support that allows multiple docker containers to run on a single machine. a container is a running instance of a container image. containers are by default seperated from one another and from the host machine.




## AH-HA MOMENTS
 - each docker container has its own private and loopback interface, just like a seperate os running in a seperate machine which re-inforce process isolation.
 - docker basically has its own fucking network stack , isn't that wild

### How does docker isolate the processes ?
At a high level (which only what i know for now..), docker uses the following linux kernel features to isolate the processes:
    - cgroups (control groups) : limit, measure, and control the resources a process can use
    - namespaces : isolate the processes from the host machine
    - union file systems : overlay multiple file systems into a single one

[What is the difference between VM adond container?](https://www.youtube.com/watch?v=cjXI-yxqGTI)
Key Sentence: **containers are about process isolation, VMs are about machine virtualization.**

### What is the diffrence between an image and container?

Two analogous way to look at the difference between containers and images:
    - like programs and processes. In the same way that a process is an executing program, a container is an executing image.
    - like classes and objects. In the same way that an object is an instance of a class, a container is an instance of an image.


### [Docker architecture](https://docs.docker.com/engine/docker-overview/#docker-architecture)


### [How to controle docker deamon from a web browser]


## Docker networking
**READ CHAPTER 5 of `Docker in Action` book**
[fairly intresting course](https://www.youtube.com/watch?v=OU6xOM0SE4o)
[absolutely intresting course](https://www.youtube.com/watch?v=MpFphzNPOcc)



## Docker as local development tool 

- Host file system pollution problem (e.g. node_modules, .env, etc.)
- Versions dependencies conflicts (e.g. node, npm, etc.)
- Different OS (e.g. Windows, Mac, Linux, etc.)

## Docker and Microservices

[A study case (how netflix transitioned to microservices architecture)](https://www.youtube.com/watch?v=CZ3wIuvmHeM&list=RDQM7FUm0ifHC4U&start_radio=1)



### MY QUESTIONS


- given we can create a 65is "how many containers we can create a single host  