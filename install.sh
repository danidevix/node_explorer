useradd -M -r -s /bin/false node_exporter
yum install wget -y
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.0/node_exporter-0.18.0.linux-amd64.tar.gz
tar xzf node_exporter-0.18.0.linux-amd64.tar.gz
cp node_exporter-0.18.0.linux-amd64/node_exporter /usr/local/bin/
chown node_exporter:node_exporter /usr/local/bin/node_exporter
cp node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter.service
systemctl enable node_exporter.service
