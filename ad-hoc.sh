ansible -i hosts.ini kicomp-xyz -m ping -u emil

ansible -i hosts.ini kicomp-xyz -a "free -h" -u emil
