useradd -M -r -s /bin/false node_exporter
wget isantri.moco.co.id/node_exporter-0.18.0.linux-amd64.tar.gz
wget https://raw.githubusercontent.com/danidevix/node_explorer/master/node_exporter.service
tar xzf node_exporter-0.18.0.linux-amd64.tar.gz
yum install -y nano htop
cp node_exporter-0.18.0.linux-amd64/node_exporter /usr/local/bin/
chown node_exporter:node_exporter /usr/local/bin/node_exporter
cp node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter.service
systemctl enable node_exporter.service
rm -rf node_exporter-0.18.0.linux-amd64.tar.gz node_exporter-0.18.0.linux-amd64 node_exporter.service
