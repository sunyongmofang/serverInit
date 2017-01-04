#!/bin/bash

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

cd > /dev/null

su - worker
git config --global user.name "sunyong"
git config --global user.email sunyongmofang@163.com

echo "please run command at worker:"
echo "ss-server -s 0.0.0.0 -p 8388 -l 1080 -k password -m aes-256-cfb -t 600 -u"
