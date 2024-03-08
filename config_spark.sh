#! /usr/bin/bash
sudo apt update
sudo apt-get install -y openjdk-17-jdk
sudo apt install unzip
for i in {1..255}; do echo "192.168.1.$i host-192-168-1-$i-de1"| sudo tee -a /etc/hosts; done
for i in {1..255}; do echo "192.168.2.$i host-192-168-2-$i-de1"| sudo tee -a /etc/hosts; done
sudo hostname host-$(hostname -I | awk '{$1=$1};1' | sed 's/\./-/'g)-de1 ; hostname
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> ~/.bashrc
source ~/.bashrc
wget https://downloads.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz
tar -zxvf spark-3.5.1-bin-hadoop3.tgz
echo "export SPARK_HOME=~/spark-3.5.1-bin-hadoop3" >> ~/.bashrc
source ~/.bashrc
echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install -y git
git clone https://github.com/akerholmida/Data-Engineering-Project-Mental-Health.git
sudo apt-get install -y python3-pip
python3 -m pip install pyspark==3.5.1 --user
python3 -m pip install pandas --user
python3 -m pip install matplotlib --user
python3 -m pip install jupyterlab --user
export PATH="$HOME/.local/bin:$PATH"
# ~/spark-3.5.1-bin-hadoop3/sbin/start-master.sh
# ~/spark-3.5.1-bin-hadoop3/sbin/start-worker.sh spark://192.168.X.Y:7077