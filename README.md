Create a `.env` to configure your network pi.
```
touch .env
```

Example `.env` file contents
```
LOCAL_NETWORK_GATEWAY=192.168.1.1
LOCAL_NETWORK_SUBNET=192.168.1.1/24
PIHOLE_STATIC_IP=192.168.1.5
PIHOLE_WEBPASSWORD=REPLACE_ME
```

Run this to make all scripts executable:
```
chmod u+x start.sh stop.sh
```

To start everything run:
```
./start.sh
```

To stop everything run
```
./stop.sh
```