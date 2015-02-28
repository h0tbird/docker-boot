# docker-boot

```
git clone https://github.com/h0tbird/docker-boot.git
cd docker-boot
./bin/build
```

Install and run:
```
sudo ln boot.service /etc/systemd/system/boot.service
sudo systemctl daemon-reload
sudo systemctl start boot
```

Tail the output:
```
journalctl -f -u boot
```
