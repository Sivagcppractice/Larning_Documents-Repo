Install Grafana
------------------------------------------------------------
You are currently in /etc/Prometheus path.

Install Grafana on Monitoring Server;

Step 1: Install Dependencies:
First, ensure that all necessary dependencies are installed:
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common

Step 2: Add the GPG Key:
cd ---> You are now in ~ path
Add the GPG key for Grafana:
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

You should see OK when executed the above command.

Step 3: Add Grafana Repository:
Add the repository for Grafana stable releases:
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

Step 4: Update and Install Grafana:
Update the package list and install Grafana:
sudo apt-get update
sudo apt-get -y install grafana

Step 5: Enable and Start Grafana Service:
To automatically start Grafana after a reboot, enable the service:
sudo systemctl enable grafana-server

Start Grafana:
sudo systemctl start grafana-server

Step 6: Check Grafana Status:
Verify the status of the Grafana service to ensure it's running correctly:
sudo systemctl status grafana-server

You should see "Active (running)" in green colour
Press control+c to come out

Step 7: Access Grafana Web Interface:
The default port for Grafana is 3000
http://<monitoring-server-ip>:3000

Default id and password is "admin"
You can Set new password or you can click on "skip now".
Click on "skip now" (If you want you can create the password)

You will see the Grafana dashboard

The first thing that we have to do in Grafana is to add the data source
Lets add the data source;

<Follow the process as explained in the video>

Click on Dashboards in the left pane, you can see both the dashboards you have just added.
