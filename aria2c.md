
sudo systemctl edit --full --force aria2-deamon-rpc.service


/etc/systemd/system/aria2-deamon-rpc.service
```
[Unit]
Description=Aria2c download manager
Requires=network.target

[Service]
Type=forking
User=www-data
Group=www-data
ExecStart=/usr/bin/aria2c --conf-path=/home/ubuntu/aria2c/aria2.conf
ExecReload=/usr/bin/killall aria2c
Restart=on-failure
RestartSec=10

[Install]
```

Run service
`sudo systemctl enable --now aria2-deamon-rpc.service`


/home/ubuntu/aria2c/aria2.conf

```
continue
dir=/home/ubuntu/downloads/
file-allocation=falloc
log-level=error
max-connection-per-server=10
summary-interval=120
daemon=true
enable-rpc=true
rpc-listen-port=6800
rpc-listen-all=true
max-concurrent-downloads=20
disable-ipv6=true
disk-cache=25M
timeout=600
retry-wait=30
max-tries=50
save-session=/home/ubuntu/aria2c/aria2.session
save-session-interval=10
```
