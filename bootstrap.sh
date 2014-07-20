# use 32 or 64 bit box?
#!/usr/bin/env bash

apt-get update
apt-get install -y python-software-properties
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:cassou/emacs
apt-get update
echo 'INSTALLING APACHE & CURL'
apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www
# apt-get --yes --force-yes install curl
apt-get -y install curl


# # install emacs
# didn't install?
echo 'INSTALLING EMACS'
apt-get --yes --force-yes install emacs24 emacs24-el emacs24-common-non-dfsg

# install jvm/ oracle jdk
# see: https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
echo 'INSTALLING JAVA'
apt-get -y install default-jre

# apt-get install -y python-software-properties
# add-apt-repository -y ppa:webupd8team/java
# apt-get update
echo 'INSTALLING ORACLE JDK'
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get --yes --force-yes install oracle-java7-installer

# install cassandra
echo 'INSTALLING CASSANDRA'
echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
apt-get update
apt-get -y install dsc20
service cassandra stop
rm -rf /var/lib/cassandra/data/system/*

# install ops center
echo 'INSTALLING OPS CENTER'
echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.community.list
apt-get update
apt-get -y install opscenter
#new
service opscenterd start

#new
reboot

# build a base box with:
# guide to making a virtualbox base box: http://docs.vagrantup.com/v2/virtualbox/boxes.html
  # is there a difference between a base box and one where these are provisioned?
  # need a base box, and then provision that box with java +
  # make an image of the built out development environment
# install cassandra
# install JVM
# I need:
# linux
# java
# JVM
# cassandra