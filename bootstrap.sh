#!/usr/bin/env bash

# setup repos
apt-get update
apt-get install -y python-software-properties # dependency of add-apt-repository
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:cassou/emacs
echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.community.list
apt-get -y install curl
curl -L http://debian.datastax.com/debian/repo_key | apt-key add
apt-get update

# install emacs
echo 'INSTALLING EMACS'
apt-get --yes --force-yes install emacs24 emacs24-el emacs24-common-non-dfsg

# install jvm / oracle jdk
# see: https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
echo 'INSTALLING JAVA'
apt-get -y install default-jre

echo 'INSTALLING ORACLE JDK'
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get --yes --force-yes install oracle-java7-installer

# install cassandra
echo 'INSTALLING CASSANDRA'
apt-get -y --force-yes install dsc20
service cassandra stop
rm -rf /var/lib/cassandra/data/system/*

# xxx ars: need to install datastax agent?

# install ops center
echo 'INSTALLING OPS CENTER'
apt-get -y --force-yes install opscenter-free
service opscenterd start
