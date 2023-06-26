sudo -s
mkdir /opt/nginx-exporter
cd /opt/nginx-exporter
sudo useradd --system --no-create-home --shell /bin/false nginx-exporter
curl -L https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.11.0/nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz -o nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
tar -zxf nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
rm nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
./nginx-prometheus-exporter --version
chown -R nginx-exporter:nginx-exporter /opt/nginx-exporter 
cp nginx-exporter.service /etc/systemd/system/nginx-exporter.service
systemctl enable nginx-exporter
systemctl start nginx-exporter