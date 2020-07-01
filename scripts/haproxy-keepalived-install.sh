#!/bin/bash

echo "Install HAproxy"
sudo apt-get update
sudo apt-get install haproxy -y



echo "Install Keepalived"
sudo add-apt-repository ppa:hnakamur/keepalived -y
sudo apt-get update
sudo apt-get install keepalived -y
