```
sudo apt install make
wget http://www.devin.com/lookbusy/download/lookbusy-1.4.tar.gz
tar -xzvf lookbusy-1.4.tar.gz
cd lookbusy-1.4/
./configure
make
sudo make install
sudo systemctl edit --full --force lookbusy.service
```
lookbusy.service:
```
[Unit]
Description=lookbusy service

[Service]
Type=simple
ExecStart=/usr/local/bin/lookbusy -c 10 -m 6000MB
Restart=always
RestartSec=10
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target
```

Run service
`sudo systemctl enable --now lookbusy.service`
