### RabbitMQ Dockerfile Readme ###

### Installation ###

1. Install [Docker](https://www.docker.com/).

2. Pull image from DockerHub:

   docker pull bekberov/rabbitmq_centos7


3. Run rabbitmq:

   docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 -v /rabbitmq/log:/data/log -v /rabbitmq/data:/data/mnesia bekberov/rabbitmq_centos7:latest


### Management Plugin ###

There is a second set of tags provided with the management plugin installed and enabled by default, which is available on the standard management port of 15672, with the default username and password of guest / guest:

$ docker run -d --hostname my-rabbit --name some-rabbit -p 8080:15672 rabbitmq:3-management

Setting default user and password
If you wish to change the default username and password of guest / guest, you can do:

$ docker run -d --hostname my-rabbit --name some-rabbit -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password rabbitmq:3-management

You can then go to http://localhost:8080 or http://host-ip:8080 in a browser and use user/password to gain access to the management console



### Other useful commands ###

docker exec -it bekberov/rabbitmq_centos7 bash

docker build --no-cache -t bekberov/rabbitmq_centos7 .
