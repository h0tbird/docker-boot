# docker-boot

This container is member of the [*booddies*](https://github.com/h0tbird/booddies) fellowship.

Clone and build:
```
git clone https://github.com/h0tbird/docker-boot.git
cd docker-boot
./bin/build
```

Install and run:
```
sudo ./bin/install
sudo systemctl start boot
```

Tail the output:
```
journalctl -f -u boot
```
