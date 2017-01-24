#!/bin/bash

yum install vim gcc man gettext libtool automake make pcre-devel -y
yum install asciidoc xmlto zlib-devel openssl-devel libsodium-devel udns-devel libev-devel -y

wget http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz
tar -zxf autoconf-latest.tar.gz
cd autoconf-latest
./configure
make && make install
cd > /dev/null

git config --global user.name "sunyong"
git config --global user.email sunyongmofang@163.com
adduser worker -d /home/worker

git clone https://github.com/shadowsocks/shadowsocks-libev.git
git clone https://github.com/91yun/serverspeeder.git

cd serverspeeder

chmod 755 serverspeeder-all.sh
./serverspeeder-all.sh

cd > /dev/null

cd shadowsocks-libev

./autogen.sh && ./configure && make && make install

chkconfig iptables off
service iptables stop

cd > /dev/null

su - worker
git config --global user.name "sunyong"
git config --global user.email sunyongmofang@163.com

echo "please run command at worker:"
echo "ss-server -s 0.0.0.0 -p 8388 -l 1080 -k password -m aes-256-cfb -t 600 -u"
