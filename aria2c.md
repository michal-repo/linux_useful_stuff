
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
