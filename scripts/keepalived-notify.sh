#!/bin/bash

TYPE=$1
NAME=$2
STATE=$3

case $STATE in
"MASTER") /usr/sbin/service haproxy start
  exit 0
  ;;
"BACKUP") /usr/sbin/service haproxy stop
  exit 0
  ;;
"FAULT")  /usr/sbin/service haproxy stop
  exit 0
  ;;
*)        echo "unknown state"
  exit 1
  ;;
esac
