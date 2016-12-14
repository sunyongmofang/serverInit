#!/bin/bash

yum -y update
yum -y install vim git gcc pcre-devel openssl-devel asciidoc xmlto man

git config --global user.name "sunyong"
git config --global user.email sunyongmofang@163.com
adduser worker -d /home/worker

git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev

./configure
make && make install

chkconfig iptables off
service iptables stop

