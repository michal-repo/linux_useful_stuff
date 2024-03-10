# Install VS Code

`sudo apt install code`

# Create user config directories

```
mkdir /home/user/vscode/server/
mkdir /home/user/vscode/user/
mkdir /home/user/vscode/ext/
```

# Create systemctl service
`sudo systemctl edit --full --force vscode-server.service`

```
[Unit]
Description=VS Code Web Server
Requires=network.target

[Service]
Type=simple
User=user
Group=user
ExecStart=/usr/bin/code serve-web --host 192.168.1.100 --port 9999 --accept-server-license-terms --server-data-dir /home/user/vscode/server/ --user-data-dir /home/user/vscode/user/ --extensions-dir /home/user/vscode/ext/ --without-connection-token
ExecReload=/usr/bin/killall code
ExecStop=/usr/bin/killall code
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Enable service
`sudo systemctl enable --now vscode-server.service`

Run service
`sudo systemctl start vscode-server.service`



# Open via web browser

http://192.168.1.100:9999/
