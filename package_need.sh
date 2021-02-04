#!/bin/bash
# Simple script to list version numbers of critical development tools
echo "install-Basic_utility on LFS on ubuntu"
echo "==^^please sceript RUN AS ROOT^^^====="

sudo ln -sf bash /bin/sh 
sudo apt-get install bison -y
sudo apt-get install yacc -y 
sudo apt-get install gawk -y
sudo apt-get install m4 -y
sudo apt-get install make -y
sudo apt-get install patch -y
sudo apt-get install texinfo -y
sudo apt-get install bzip2 -y
echo "-------gcc -6 install---------"
sudo apt-get update && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && \
sudo apt-get install gcc-6 g++-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
