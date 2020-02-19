#!/usr/bin/env bash
yum update -y
yum install -y which net-tools telnet
yum install -y gcc gcc-c++ cmake
yum install -y tree vim wget curl
yum install -y openssl openssl-devel
yum install -y zlib zlib-devel
yum install -y bzip2 bzip2-devel
yum install -y readline readline-devel
yum install -y sqlite sqlite-devel
yum install -y mysql mysql-devel
yum install -y git subversion
yum groupinstall -y 'Development Tools'

cp /source/.vimrc ~/.vimrc