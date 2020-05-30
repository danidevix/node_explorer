#!/bin/bash
wget https://dl.grafana.com/oss/release/grafana-7.0.0-1.x86_64.rpm
rpm -ivh grafana-7.0.0-1.x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
systemctl enable grafana-server.service
firewall-cmd --zone=public --add-port=3000/tcp --permanent

useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo touch /etc/prometheus/prometheus.yml
sudo touch /etc/prometheus/prometheus.rules.yml
us
#VERSION=2.2.1
VERSION=$(curl https://raw.githubusercontent.com/prometheus/prometheus/master/VERSION)
wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz
tar xvzf prometheus-${VERSION}.linux-amd64.tar.gz
sudo cp prometheus-${VERSION}.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-${VERSION}.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-${VERSION}.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-${VERSION}.linux-amd64/console_libraries /etc/prometheus
cat ./prometheus/prometheus.yml | sudo tee /etc/prometheus/prometheus.yml
cat ./prometheus/prometheus.rules.yml | sudo tee /etc/prometheus/prometheus.rules.yml
cat ./prometheus/prometheus.service | sudo tee /etc/systemd/system/prometheus.service
rm -rf /etc/systemd/system/prometheus.service
wget https://raw.githubusercontent.com/danidevix/node_explorer/master/prometheus.service
sudo mv prometheus.service /etc/systemd/system/prometheus.service
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/promethe
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
grafana-cli admin reset-admin-password danidevix
echo "password =danidevix ||| reset password via terminal >> |grafana-cli admin reset-admin-password password| "
rm prometheus-${VERSION}.linux-amd64.tar.gz 
rm -rf prometheus-${VERSION}.linux-amd64 grafana-7.0.0-1.x86_64.rpm
