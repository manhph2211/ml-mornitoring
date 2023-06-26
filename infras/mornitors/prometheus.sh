sudo useradd --system --no-create-home --shell /bin/false prometheus
curl -L https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz -o prometheus-2.41.0.linux-amd64.tar.gz
tar -xvf prometheus-2.41.0.linux-amd64.tar.gz
mkdir -p /data /etc/prometheus
cd prometheus-2.41.0.linux-amd64
mv prometheus promtool /usr/local/bin/
mv consoles/ console_libraries/ /etc/prometheus/
mv prometheus.yml /etc/prometheus/prometheus.yml
chown -R prometheus:prometheus /etc/prometheus/ /data/
sudo cp /home/ubuntu/prometheus.service /etc/systemd/system/prometheus.service 
sudo cp /home/ubuntu/prometheus.yml /etc/prometheus/prometheus.yml
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus