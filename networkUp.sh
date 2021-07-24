#!/bin/bash
docker network create \
    --driver=macvlan \
    --gateway=192.168.1.1 \
    --subnet=192.168.1.1/24 \
    --ip-range=${PIHOLE_STATIC_IP}/32 \
    -o parent=eth0 \
    VLAN_pi-hole
echo "VLAN_pi-hole network created"
exit 0