#!/bin/bash

# Turn on 'Share Internet from Ubuntu, then run the following'

# Enable IP forwarding
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

# Add a NAT rule for clients to reach internet via Wi-Fi
sudo iptables -t nat -A POSTROUTING -o wlp9s0 -j MASQUERADE

sudo iptables -A FORWARD -i enp11s0 -o wlp9s0 -j ACCEPT
sudo iptables -A FORWARD -i wlp9s0 -o enp11s0 -m state --state ESTABLISHED,RELATED -j ACCEPT
