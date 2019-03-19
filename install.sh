#!/bin/bash
cd /home/pi ;
echo "    #Attemping APT Update";
echo " ";
echo " ";
sudo apt-get --yes --force-yes update ;
echo " ";
echo " ";
echo "    #Attemping APT Upgrade";
echo " ";
echo " ";
sudo apt-get --yes --force-yes upgrade ;
echo " ";
echo " ";
echo "    #Adding Node to RPi Repository";
echo " ";
echo " ";
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -;
echo " ";
echo " ";
echo "    #Installing Raspotify";
echo " ";
echo " ";
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh;
echo " ";
echo " ";
echo "    #Installing Shairport-sync, Node, Mosquitto and LibAvahi";
echo " ";
echo " ";
sudo apt-get --yes --force-yes install shairport-sync nodejs libavahi-compat-libdnssd-dev mosquitto libasound2-plugin-equal;
echo " ";
echo " ";
echo "   #Installing Bluetooth A2DP and its configurations";
echo " ";
echo " ";
sudo apt-get --yes --force-yes install pulseaudio-module-bluetooth ;
sudo mkdir .bluetooth ;
sudo cp /home/pi/PIBOX/bluetooth.sh /home/pi/.bluetooth ;
echo " ";
echo " ";
echo "    #Installing HomeBridge, HomeBridge's PlugIns, Node-Red";
echo " ";
echo " ";
sudo npm install -g --unsafe-perm homebridge homebridge-pc-volume homebridge-mqtt node-red node-red-node-serialport node-red-contrib-blynk-websocket node-red-contrib-blynk-ws ;
echo " ";
echo " ";
echo "    #Installing Blynk-Server";
echo " ";
echo " ";
sudo apt-get --yes --force-yes install oracle-java8-jdk ;
wget https://github.com/blynkkk/blynk-server/releases/download/v0.41.3/server-0.41.3-java8.jar ;
sudo cp -rf /home/pi/Blynk /home/pi/.Blynk ;
sudo cp server-0.41.3-java8.jar /home/pi/.Blynk ;
sudo cp /home/pi/PIBOX/Boots/blynk /etc/init.d ;
echo "    #Configurating booteables";
echo " ";
echo " ";
sudo cp /home/pi/PIBOX/Boots/* /etc/init.d ;
sudo chmod 775 /etc/init.d/homebridge /etc/init.d/node-red /etc/init.d/blynk /etc/init.d/autoblue;
sudo update-rc.d blynk defaults ;
sudo update-rc.d homebridge defaults ;
sudo update-rc.d node-red defaults ;
sudo update-rc.d autoblue defaults ;
sudo mkdir /home/pi/.homebridge ;
sudo chmod 777 /home/pi/.homebridge ;
sudo cp /home/pi/PIBOX/config.json /home/pi/.homebridge ;
sudo cp /home/pi/PIBOX/flows_raspberrypi.json /home/pi/.node-red/flows_raspberrypi.json ;
echo " ";
echo " ";
echo "    #Configurating Audio, Fan, etc.. scripts" ;
sudo mkdir /home/pi/.audio /home/pi/.audioin /home/pi/.fan ;
sudo cp -rf /home/pi/PIBOX/audio /home/pi/.audio ;
sudo cp -rf /home/pi/PIBOX/audioin /home/pi/.audioin ;
sudo cp -rf /home/pi/PIBOX/fan /home/pi/.fan ;
echo " ";
echo " ";
echo "    # Installing KODI and its configuration" ;
echo " ";
echo " ";
sudo apt-get --yes --force-yes install kodi kodi-inputstream-adaptive python-crypto ;
wget https://pypi.python.org/packages/d6/99/56ac930e35394c93440f1a6e254cf4573098503ff4c1851e820600a46a85/pycryptodomex-3.4.7.tar.gz ;
tar -xvf pycryptodomex-3.4.7.tar.gz ;
sudo cp pycryptodomex-3.4.7/lib/Crypto/Util/Padding.py ;
sudo ln -s /usr/lib/python2.7/dist-packages/Crypto /usr/lib/python2.7/dist-packages/Cryptodome ;
sudo rm -rf pycryptodomex-3.4.7 ;
wget https://github.com/CastagnaIT/plugin.video.netflix/archive/0.13.19.zip ;
echo " ";
echo " ";
echo "    #Configurating Raspotify's and Shairport-Sync's outputs";
echo " ";
echo " ";
sudo cp /home/pi/PIBOX/raspotify /etc/default ;
sudo cp /home/pi/PIBOX/shairport-sync.conf /etc ;
echo " ";
echo " ";
echo "    #Configurating ALSA for multiple audio routing and AlsaEq";
sudo cp /home/pi/PIBOX/asound.conf /etc ;
echo " ";
echo " ";
echo "    #Configurating StartUp Sound";
sudo mkdir /etc/sound ;
sudo cp /home/pi/PIBOX/215415__unfa__ping.wav /etc/sound/startup.wav ;
sudo echo "aplay -D duplex /etc/sound/startup.wav" > /etc/init.d/startup ;
sudo chmod 775 /etc/init.d/StartUp ;
sudo update.rc StartUp defaults ;
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo "     Adding the Netflix Add-On is still needed. You can add the ZIP file it trhu KODI and it's located in home folder (0.13.19.zip)" ;
echo "----------------------------------ALL  DONE------------------------------------";
read -p "---------------------------PRESS ENTER TO FINALIZE-----------------------------";
sudo reboot;
