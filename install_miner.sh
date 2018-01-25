#!/bin/bash
read -p "Enter pool username: " USER
read -p "Worker name is $(hostname). Enter worker password: " PASSWORD

# Update apt and install git
sudo apt update -y
sudo apt install git -y

# Clone miner and install deps
git clone https://github.com/fireworm71/veriumMiner
sudo apt install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev -y

# Build and output some guidance
cd veriumMiner 
./build.sh
echo "./cpuminer -n 1048576 -o stratum+tcp://ssh.wilhelmsen.nu:3332 -u $USER.$(hostname) -p $PASSWORD $@" > run.sh
chmod +x run.sh

cd veriumMiner
echo ""
echo "Start the miner with ./run.sh, additional parameters will be passed through to the cpuminer executable."
echo "Example"
echo "* To limit to the number of N threads: ./run.sh -t 1"
echo ""
