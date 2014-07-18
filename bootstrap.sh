#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www

# build a base box with:
# guide to making a virtualbox base box: http://docs.vagrantup.com/v2/virtualbox/boxes.html
  # is there a difference between a base box and one where these are provisioned?
# install cassandra
# install JVM
# I need:
# linux
# java
# JVM
# cassandra