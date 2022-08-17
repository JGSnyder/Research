#!/bin/sh

sudo -n true
test $? -eq 0 || exit 1 "enter command with sudo privileges"


echo Installing basic requirements...
BASIC_REQT="git"
apt-get install -y $BASIC_REQT

echo Installing requirements for connection to the RM500Q-AE Quectel modem for Ubuntu OS
echo Starting with Diagparser
DIAGPARSER_REQT="libgnutls-dev make gcc g++ libtalloc-dev autoconf automake libtool pkg-config"
apt-get install -y $DIAGPARSER_REQT
git clone https://github.com/moiji-mobile/diag-parser
cd diag-parser
./build/build_local.sh
cd ../

echo "Now Minicom..."
MINICOM_REQT="minicom"
apt-get install -y $MINICOM_REQT

echo "Android requirements building..."
ANDROID_REQT="adb android-tools-adb android-tools-fastboot gcc-arm-linux-gnueabi g++-arm-linux-gnueabi gdb-arm-none-eabi gcc-arm-none-eabi libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev binwalk"
apt-get install -y $ANDROID_REQT

echo "Netcat requirements building..."
NETCAT_REQT="netcat"
apt-get install -y $NETCAT

echo "QCSuper requirements building..."
# QCSuper
git clone https://github.com/P1sec/QCSuper.git qcsuper
cd qcsuper

QCSUPER_REQT="python3-pip wireshark"
apt install -y $QCSUPER_REQT
pip3 install --upgrade pyserial crcmod https://github.com/P1sec/pycrate/archive/master.zip

echo "Complete."
