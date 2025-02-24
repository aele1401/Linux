# Linux Systems Administration
## Setting & Verifying Permissions on Sensitive Files
- Permisions on `/etc/shadow` allows only `root` read and write access.
    * Inspecting permissions: `ls -l /etc/shadow`
    * Set permissions: `sudo chmod 600 /etc/shadow`
- Permissions on `/etc/gshadow` only allows `root` read and write access.
    * Inspect permissions: `ls -l /etc/gshadow`
    * Set permissions: `sudo chmod 600 /etc/gshadow`
- Permissions on `/etc/group` allows `root` read and write access, also allowing everyone read-access only.
    * Inspect permissions: ` ls -l /etc/gshadow`
    * Set permissions: `sudo chmod 622 /etc/gshadow`
- Permissions on `/etc/passwd` allows `root` read and write access, and read-acces only for everyone else.
    * Inspect permissions: `ls -l /etc/passwd`
    * set permissions: `sudo chmod 622 /etc/passwd`

## Creating User Accounts
- Add user accounts for the following: `sam`, `joe`, `amy`, `sara`, and `admin` and ensure only admin has sudo access.
    * Adding users Command: `sudo useradd Sam, Joe, Amy, Sara, and Admin`
    * Granting sudo access command: `sudo usermod -aG sudo Admin`

## Creating User Groups & Collaborative Folders
- Add an `Engineers` group to the system.
    * Command for adding group: `addgroup Engineers`
- Add the previous list of users to the managed group. 
    * Command for adding users: `sudo usermod -aG Engineers Sam, Joe, Amy, Sara`
- Create a shared folders for the group at `/home/Engineers`.
    * Command: `sudo mkdir /home/Engineers`
- Change ownership on the newly created shared folder to the `Engineers` group.
    * Command: `sudo chgrp -R Engineers /home/Engineers` or `sudo chgrp engineers /home/engineers | sudo chmod 770 /home/engineers/`

## Lynis Auditing & Reporting
- Install Lynis with `sudo apt install Lynis`
- View documentation and instruction/help with `man lynis` or `sudo /usr/sbin/lynis`
- Run adit with `sudo lynis audit system`
- Lynis output report on hardening system:
![Diagram](https://github.com/aele1401/Linux/blob/main/Systems_Administration/Lynis_Report1.JPG)


## CHKROOTKIT
- Install chkrootkit `sudo apt install chkrootkit`
- Documentation and instructions: `man chkrootkit`
- Running export mode: `sudo chkrootkit -x`
- Report on hardening system:
![Diagram](https://github.com/aele1401/Linux/blob/main/Systems_Administration/CHKROOTKIT.JPG)
