#!/bin/bash

LOGFILE=~/script.log
ERRORFILE=~/errors.log

cd /usr/src

echo "----- Asterisk -----"
echo "----- Fetch Asterisk -----" >> $LOGFILE
if ! [ -f /usr/src/asterisk-$1.tar.gz ]
    then wget -O asterisk-$1.tar.gz http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-$1-current.tar.gz -q --show-progress
fi

dialog --pause 'Download OK!' 10 60 10 --

dialog --pause 'Asterisk!' 10 60 10 --
cd /usr/src
mkdir /usr/src/asterisk-$1
tar xvfz asterisk-$1.tar.gz --directory /usr/src/asterisk-$1 --strip-components=1
cd asterisk-$1

dialog --pause 'Asterisk Contrib!' 10 60 10 --

contrib/scripts/get_mp3_source.sh
contrib/scripts/install_prereq install
./configure

dialog --pause 'Asterisk maker menuselect and then compile!' 10 60 10 --



