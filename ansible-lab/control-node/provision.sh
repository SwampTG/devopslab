#/bin/sh

sudo yum -y install epel-release #repository for ansible in centos
echo "Installing Ansible..."
sudo yum -y install ansible
cat <<EOM >> /etc/hosts
192.168.56.2 control-node
192.168.56.3 app01
192.168.56.4 db01
EOM

cat >> /etc/ansible/hosts <<- EOM
[apps]
app01

[dbs]
db01
EOM  
