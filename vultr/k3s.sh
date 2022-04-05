#!/bin/bash 
curl -sfL https://get.k3s.io | sh -
ip link add dev edge type dummy
ip link set edge up
ip addr add dev edge 149.28.205.85/32
apt install bird
rm -rf /etc/bird/bird.conf
touch /etc/bird/bird.conf
  