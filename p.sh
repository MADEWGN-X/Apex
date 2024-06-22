cd /etc/
rm keep.sh
wget https://raw.githubusercontent.com/MADEWGN-X/Apex/master/keep.sh
chmod +x keep.sh

cat > /etc/systemd/system/keeps.service << END
[Unit]
Description=auto restart - @madewgn
After=network.target

[Service]
WorkingDirectory=/etc/
ExecStart=bash keep.sh
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start keeps
systemctl enable keeps
systemctl restart keeps
