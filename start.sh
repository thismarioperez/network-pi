#!/bin/bash
envup() {
  local file=$([ -z "$1" ] && echo ".env" || echo ".env.$1")

  if [ -f $file ]; then
    set -a
    source $file
    set +a
  else
    echo "No $file file found" 1>&2
    return 1
  fi
}

networkUp() {
  if [ ! "$(docker network ls | grep VLAN_pi-hole)" ]; then
    echo "Creating network VLAN_pi-hole ..."
    docker network create \
      --driver=macvlan \
      --gateway=${LOCAL_NETWORK_GATEWAY} \
      --subnet=${LOCAL_NETWORK_SUBNET} \
      --ip-range=${PIHOLE_STATIC_IP}/32 \
      -o parent=eth0 \
      VLAN_pi-hole
  else
    echo "VLAN_pi-hole network exists."
  fi

  if [ ! "$(docker network ls | grep VLAN_heimdall)" ]; then
    echo "Creating network VLAN_heimdall ..."
    docker network create \
      --driver=macvlan \
      --gateway=${LOCAL_NETWORK_GATEWAY} \
      --subnet=${LOCAL_NETWORK_SUBNET} \
      --ip-range=${HEIMDALL_STATIC_IP}/32 \
      -o parent=eth0 \
      VLAN_heimdall
  else
    echo "VLAN_heimdall network exists."
  fi
}

# load environment
envup

# check that pi-hole network exists
networkUp

# build containers
docker-compose up -d

exit 0
