sudo mkdir /opt/nginx-exporter
cd /opt/nginx-exporter
sudo useradd --system --no-create-home --shell /bin/false nginx-exporter
sudo curl -L https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.11.0/nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz -o nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
sudo tar -zxf nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
sudo rm nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
sudo chown -R nginx-exporter:nginx-exporter /opt/nginx-exporter 
sudo cp /home/ubuntu/nginx-exporter.service /etc/systemd/system/nginx-exporter.service
sudo systemctl enable nginx-exporter
sudo systemctl start nginx-exporter