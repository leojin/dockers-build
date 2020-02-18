#!/usr/bin/env bash
yum update -y
yum install -y which net-tools telnet
yum install -y gcc gcc-c++ cmake
yum install -y tree vim wget curl openssl
yum install -y git subversion
yum groupinstall -y 'Development Tools'

cp /source/.vimrc ~/.vimrc