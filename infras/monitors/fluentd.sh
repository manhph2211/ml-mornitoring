sudo apt update
sudo apt -y install build-essential ruby-dev 
sudo gem install fluentd --no-doc
sudo gem install fluent-plugin-prometheus
sudo mkdir /etc/fluent/
sudo cp nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
sudo cp fluent.conf /etc/fluent/fluent.conf
sudo cp fluentd.service /etc/systemd/system/fluentd.service
sudo systemctl enable fluentd
sudo systemctl start fluentd
sudo systemctl status fluentd
sudo systemctl restart prometheus