#!/bin/bash
read -p "Enter pool username/address: " USER
read -p "Enter worker username: " WORKERUSER
read -p "Enter worker password: " PASSWORD

# Update apt and install git
sudo apt update -y
sudo apt install git -y

# Clone miner and install deps
git clone https://github.com/fireworm71/veriumMiner
sudo apt install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev -y

# Enable HugePages
echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
 
# Build and output some guidance
cd veriumMiner
./build.sh
cd ..

echo "#!/bin/bash" >> run.sh
echo "cd veriumMiner" >> run.sh
echo "./cpuminer -n 1048576 -o stratum+tcp://london.blockbucket.net:3002 -u $USER.$WORKERUSER -p $PASSWORD \$@" >> run.sh
chmod +x run.sh

echo ""
echo "Start the miner with ./run.sh, additional parameters will be passed through to the cpuminer executable. By default the miner will spawn N number of threads where N = (number of cpu cores) * 2."
echo "Usage: \t./run [-options]"
echo "\t[-t limit to the number of N threads]"
echo ""
echo "Examples:"
echo "\t./run -t 1\t Avoids burning down your house."
