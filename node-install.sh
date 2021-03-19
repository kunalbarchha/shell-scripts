#!/bin/bash
#!/bin/sh

echo --------- Updating Package Lists ---------
sudo apt-get update 

echo --------- Installing Dependencies ---------
sudo apt-get install build-essential software-properties-common

echo --------- Adding Bitcoin PPA FOR Libdb ---------
sudo apt-add-repository ppa:bitcoin/bitcoin -y && sudo apt-get update

echo --------- Install GIT, Net Tools, HTOP ---------
sudo apt-get install git curl net-tools htop -y

echo --------- Installing Bitcoin Dependencies ---------
sudo apt-get install -y libssl-dev libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libtool libevent-dev automake autoconf pkg-config bsdmainutils

echo --------- Cloning Bitcoin Repository ---------
cd ~ && git clone https://github.com/bitcoin/bitcoin && cd bitcoin

echo --------- Building BitcoinD and Bitcoin-Cli ---------
./autogen.sh 

echo --------- Configuring Dependencies ---------
./configure --without-github

echo --------- Compiling Bitcoind and Bitcoin-Cli ---------
make

echo --------- Copying binaries to usr/bin/ ---------
cd ~/bitcoin/src && sudo cp bitcoind /usr/bin && cp bitcoin-cli /usr/bin && mkdir ~/.bitcoin

echo --------- Setup completed ---------
echo CREATE BITCOIN.CONF FILE WITH YOUR REQUIRED CONFIGURATION AND LAUNCH WITH
echo bitcoin -daemon
