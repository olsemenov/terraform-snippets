#!/bin/sh
echo $@
echo "start"
cd /home/azuredevopsuser
mkdir agent
cd agent
wget https://vstsagentpackage.azureedge.net/agent/2.165.2/vsts-agent-linux-x64-2.165.2.tar.gz
tar zxvf vsts-agent-linux-x64-2.165.2.tar.gz
chmod -R 777 .
echo "extracted"
./bin/installdependencies.sh
echo "dependencies installed"
sudo -u azuredevopsuser ./config.sh --unattended --url $1 --auth pat --token $2 --pool $3 --agent $4 --acceptTeeEula --work ./_work --runAsService
echo "configuration done"
./svc.sh install
echo "service installed"
./svc.sh start
echo "service started"
echo "config done"
exit 0
