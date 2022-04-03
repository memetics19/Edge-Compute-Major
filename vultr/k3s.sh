#!/bin/bash 
curl -sfL https://get.k3s.io | sh -
ip link add dev edge type dummy
ip link set edge up
ip addr add dev edge 149.28.205.85/32
apt install bird
rm -rf /etc/bird/bird.conf
touch /etc/bird/bird.conf
  GNU nano 4.8                                                      /etc/bird/bird.conf                                                      Modified  
router id 207.148.78.86;

protocol bgp vultr
{
        local as 4288000392;
        source address 207.148.78.86;
        import none;
        export all;
        graceful restart on;
        multihop 2;
        neighbor 169.254.169.254 as 64515;
        password "b4Rk8KNNjeOlXrDq";
}

protocol static
{
    route  103.181.194.0/24 via "207.148.78.86";
}

