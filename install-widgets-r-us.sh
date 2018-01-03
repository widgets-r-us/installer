#!/usr/bin/env bash

# This script will take several minutes to install all the dependencies
mkdir widgets-r-us
cd widgets-r-us
git clone https://github.com/widgets-r-us/model.git model
git clone https://github.com/widgets-r-us/host.git host
git clone https://github.com/widgets-r-us/web-client.git web-client
cd model
npm install
cd ../host
npm install
cd ../web-client
npm install
read -p "All finished, now execute start-widgets-r-us-dev-db.sh"
