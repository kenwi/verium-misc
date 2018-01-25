sudo apt update -y
sudo apt install git -y

git clone https://github.com/fireworm71/veriumMiner

sudo apt install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev -y

cd veriumMiner
./build.sh
echo "./cpuminer -n 1048576 -o stratum+tcp://ssh.wilhelmsen.nu:3332 -u myusername.$(hostname) -p pasword $@" > run.sh
chmod +x run.sh

echo ""
echo "Edit and execute run.sh to start the miner. Additional parameters will be passed through to the cpuminer executable."
echo "Example: To limit to the number of N threads: ./run.sh -t 1"
echo ""
