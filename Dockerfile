# Pull image from local repository or DockerHub.
 FROM antik486/centos71

 MAINTAINER bekberov <bekberovkerim@gmail.com>

# Add file *.sh
 ADD prepared_file.sh /usr/local/bin/


# Install RabbitMQ.

 RUN  \
        yum update -y  && \
        yum install -y https://www.rabbitmq.com/releases/erlang/erlang-18.2-1.el7.centos.x86_64.rpm http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.1/rabbitmq-server-3.6.1-1.noarch.rpm && \
        yum clean all  && \
        rm -rf /var/tmp/*  && \
        /usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management  && \
# RUN /usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
        echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config  && \
        chmod +x /usr/local/bin/prepared_file.sh


# Define environment variables for db-files and log.
 ENV RABBITMQ_LOG_BASE /data/log
 ENV RABBITMQ_MNESIA_BASE /data/mnesia


# Define mount volume.
 VOLUME ["/data/log", "/data/mnesia"]


# Define working directory (home dir which we start to work).
 WORKDIR /var/lib/rabbitmq


# Define default command.
 CMD ["prepared_file.sh"]

# Opening ports for rabbitmq infrastructure services
# 5672 rabbitmq-server - amqp port
# 15672 rabbitmq-server - for management plugin
# 4369 epmd - for clustering
# 25672 rabbitmq-server - for clustering

 EXPOSE 5672 15672 4369 25672
