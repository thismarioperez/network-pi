#!/bin/bash
. .env
docker network create \
    --driver=macvlan \
    --gateway=${LOCAL_NETWORK_GATEWAY} \
    --subnet=${LOCAL_NETWORK_SUBNET} \
    --ip-range=${PIHOLE_STATIC_IP}/32 \
    -o parent=eth0 \
    VLAN_pi-hole
echo "VLAN_pi-hole network created"
exit 0