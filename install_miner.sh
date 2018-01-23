sudo apt update -y
sudo apt install git -y

git clone https://github.com/fireworm71/veriumMiner

sudo apt install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev -y

cd veriumMiner
./build.sh
echo "./cpuminer -n 1048576 -o stratum+tcp://eu.vrm.mining-pool.ovh:3032 -u user.$(hostname) -p pasword $@" > run.sh
chmod +x run.sh

echo "Execute run.sh to start the miner. Additional parameters will be passed through to the cpuminer executable."
