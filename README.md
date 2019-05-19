# Docker-for-Pintos

For easy develop pintos on macOS in CS302 OS 2019 Spring, SUSTech

## Base on

- [pintos development environment for KAIST CS330](https://github.com/sean-ahn/pintos-env)
- [Pintos in a Docker container](https://github.com/JohnStarich/docker-pintos)

## How to use on macOS

### Prerequisite

#### 0. Get pintos source code

You can get the code from your teacher or the stanford official website [pintos.tar.gz](http://www.stanford.edu/class/cs140/projects/pintos/pintos.tar.gz) and put the files like below.

``` bash
.
├── Dockerfile
├── README.md
├── docker-compose.yml
├── docker-sync.yml
└── pintos
    ├── AUTHORS
    ├── LICENSE
    └── src
```

#### 1. Install docker & docker-compose

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/#install-compose)

#### 2. Install docker-sync

``` bash
$ gem install docker-sync
```

#### 3. Build a image

``` bash
$ docker-compose build
```

### Start containers

```
$ docker-sync-stack start
```

> Access http://localhost:5000! You can use gdb with GUI in browser! As shown in the screenshot below.

![official website image](https://raw.githubusercontent.com/cs01/gdbgui/master/screenshots/gdbgui_animation.gif)

### Access container

```
$ docker exec -it pintos-dev bash
```

From now on, you are in a docker container.

```
root@{CONTAINER-ID}:~/pintos/src# ls
devices  examples  filesys  lib  LICENSE  Make.config  Makefile  Makefile.build  Makefile.kernel  Makefile.userprog  misc  tests  threads  userprog  utils  vm
root@{CONTAINER-ID}:~/pintos/src# cd threads
root@{CONTAINER-ID}:~/pintos/src/threads# make check
```

- You don't need to modify source code in this container. You can modify your code in host system.
- You have to compile source code in this container.

### Clean containers

```
$ docker-sync-stack clean
```

## Official websites

- [Pintos](https://web.stanford.edu/class/cs140/projects/pintos/pintos.html)

- [Docker](https://docs.docker.com/)

- [docker-sync](http://docker-sync.io/)

- [gdbgui](https://gdbgui.com/)
