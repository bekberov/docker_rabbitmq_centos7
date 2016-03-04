#!/bin/bash

# Create new user and password for RabbitMQ Managment plugin

  rabbitmqctl add_user bekberov bekberov
  rabbitmqctl set_user_tags bekberov administrator
  rabbitmqctl set_permissions -p / bekberov ".*" ".*" ".*"
