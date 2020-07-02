#!/bin/bash

# Move files to the correct directory
sudo mv /tmp/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo mv /tmp/keepalived.conf /etc/keepalived/keepalived.conf
sudo mv /tmp/notify.sh /usr/local/bin/keepalived-notify.sh

sudo service haproxy restart
sudo service keepalived restart
