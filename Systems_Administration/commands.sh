# Setting Permissions on Sensitive Files
ls -l /etc/shadow
sudo chmod 600 /etc/shadow
ls -l /etc/gshadow
sudo chmod 600 /etc/gshadow
ls -l /etc/group
ls -l /etc/passwd

# Creating User Accounts
sudo useradd Sam, Joe, Amy, Sara, and Admin
usermod -aG sudo Admin

# Creating User Groups & Collaborative Folder
sudo groupadd Engineers
sudo usermod -aG Engineers Sam, Joe, Amy, Sara
sudo mkdir /home/Engineers
sudo chgrp -R Engineers /home/Engineers

# Lynis Auditing & Reporting
sudo apt-get install Lynis
man Lynis
sudo lynis audit system