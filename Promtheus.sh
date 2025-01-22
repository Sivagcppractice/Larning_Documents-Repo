Installing Prometheus
--------------------------------------------------
First, create a dedicated Linux user for Prometheus and download Prometheus
sudo useradd --system --no-create-home --shell /bin/false prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.47.1/prometheus-2.47.1.linux-amd64.tar.gz

Extract Prometheus files, move them, and create directories:
tar -xvf prometheus-2.47.1.linux-amd64.tar.gz
cd prometheus-2.47.1.linux-amd64/
sudo mkdir -p /data /etc/prometheus
sudo mv prometheus promtool /usr/local/bin/
sudo mv consoles/ console_libraries/ /etc/prometheus/
sudo mv prometheus.yml /etc/prometheus/prometheus.yml

Set ownership for directories:
sudo chown -R prometheus:prometheus /etc/prometheus/ /data/

Create a systemd unit configuration file for Prometheus:
sudo vi /etc/systemd/system/prometheus.service

Add the following content to the prometheus.service file:
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

StartLimitIntervalSec=500
StartLimitBurst=5

[Service]
User=prometheus
Group=prometheus
Type=simple
Restart=on-failure
RestartSec=5s
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/data \
  --web.console.templates=/etc/prometheus/consoles \
  --web.console.libraries=/etc/prometheus/console_libraries \
  --web.listen-address=0.0.0.0:9090 \
  --web.enable-lifecycle

[Install]
WantedBy=multi-user.target

Explanation of the key elements in the above prometheus.service file:
User and Group specify the Linux user and group under which Prometheus will run.
ExecStart is where you specify the Prometheus binary path, the location of the configuration file (prometheus.yml), the storage directory, and other settings.
web.listen-address configures Prometheus to listen on all network interfaces on port 9090.
web.enable-lifecycle allows for management of Prometheus through API calls.


Enable and start Prometheus:
sudo systemctl enable prometheus
sudo systemctl start prometheus

Verify Prometheus's status:
sudo systemctl status prometheus

Press Control+c to come out

Access Prometheus in browser using your server's IP and port 9090:
http://<your-server-ip>:9090

If it doesn't work, in the web link of browser, remove 's' in 'https'. Keep only 'http' and now you will be able to see.
You can see the Prometheus console.
Click on 'Status' dropdown ---> Click on 'Targets' ---> You can see 'Prometheus (1/1 up)'
