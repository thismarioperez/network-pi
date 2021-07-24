# Network Pi
A portable configuration of docker containers to deploy to a raspberry pi on your local network.

Requirements:
- [Raspberry Pi 4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)

- [docker](https://docs.docker.com/engine/install/debian/)

- [docker-compose](https://docs.docker.com/compose/install/#install-using-pip)

- git. Easily install on raspberry pi with `sudo apt install git`

# Services this Installs
- [pi-hole](https://docs.pi-hole.net/)

- [rpi-monitor](https://xavierberger.github.io/RPi-Monitor-docs/index.html)
# Configuration
Before running the start script in this project, you'll want to configure a static route on your router that will be used for the pi-hole service. You'll also want to generate a dummy mac address to assign to the pi-hole service.

This project creates a macvlan network with only 1 allowed ip address on it. This ip address will be a static address on your network that you can point your router or other devices to for dns filtering.

Create a `.env` file to configure your network pi.
```
touch .env
```

Example `.env` file contents
```
# Point this to your router's IP address
LOCAL_NETWORK_GATEWAY=192.168.1.1
# Configure your router's subnet.
LOCAL_NETWORK_SUBNET=192.168.1.1/24
# Configure a dummy mac address to assign to the pi-hole service
PIHOLE_MAC_ADDRESS=02:42:c0:a8:01:d8
# Configure a reserved IP address on your network to give to the pi-hole service
PIHOLE_STATIC_IP=192.168.1.5
# Configure a password to use to log in to the pi-hole service
PIHOLE_WEBPASSWORD=REPLACE_ME
```

Run this to make all scripts executable:
```
chmod u+x start.sh stop.sh
```

# Start/Stop Containers
To start everything run:
```
./start.sh
```

To stop everything run
```
./stop.sh
```