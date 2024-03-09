#! /usr/bin/bash
sudo apt update
sudo apt-get install -y openjdk-17-jdk
sudo apt install unzip
for i in {1..255}; do echo "192.168.1.$i host-192-168-1-$i-de1"| sudo tee -a /etc/hosts; done
for i in {1..255}; do echo "192.168.2.$i host-192-168-2-$i-de1"| sudo tee -a /etc/hosts; done
sudo hostname host-$(hostname -I | awk '{$1=$1};1' | sed 's/\./-/'g)-de1 ; hostname
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> ~/.bashrc
source ~/.bashrc
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
tar -xvf hadoop-3.3.6.tar.gz
wget https://zenodo.org/records/1043504/files/corpus-webis-tldr-17.zip
unzip corpus-webis-tldr-17.zip