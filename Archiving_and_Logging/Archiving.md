# Archiving & Logging
### Creating, Extracting, Compressing, Managing tar Backup Archives
- Tar commands and instructions:
	* Extract tar file to current directory `tar -xf TarDocs.tar`
	* Create the *Javaless_Doc.tar* archive from the *TarDocs/* directory, excluding the *TarDocs/Documents/Java* directory: `tar --exclude='TarDocs/Documents/Java' -c>`
	* Ensure *Java/* is not om the new *Javaless_Docs.tar* archive: `tar -tf Javaless_Docs.tar 'TarDocs/Documents/Java/'` or `tar -tf Javaless_Docs.tar --wildcards '*/>`
### Creating Incremental Archives
- Incremental archive called *logs_backup_tar.gz*: `sudo tar cvvg var_log.snar -f logs_backup-2.tar.gz -z /var/log`
- Critical Analysis Question:
  	* Why wouldn't you use the options *-x* and *-c* at the same time with *tar*? `*x* option is used to extract from an archive and *-c* option creates an archive`

### Creating, Managing, and Automating Cron Jobs
- This cron job archives the authorization log containing user authentication information in the *auth.log* file under the */var/log/* directory
  	* `cron job = 0 6 * * 3 tar czf ~/backups/auth/auth_backup.tgz /var/log/auth.log >> /dev/null 2>&1`

### Bash Scripts
- Brace expansion allows to create multiple subdirectories
  	* Create a *backups* directory with *freemem, diskuse, openlist, and freedisk* subdirectories
	* `mkdir backups/{freemem,diskuse,openlist,freedisk}`
	* `System.sh` script (*can be found in the "scripts" directory of this repository*) shows unallocated memory, disk use, open files, and free disk space
	* Make `system.sh` an executable with: `chmod +x system.sh` or `chmod u+x system.sh`
- Verify script execution with
	* Run script: `./system.sh`
	* View output: `find ~/backups -name *.txt -type f | xargs cat`
- Creating weekly cron job
	* `sudo cp ~system.sh /etc/cron.weekly/`

### Performing Log Filtering with Journal Entries
- Use `journalctl -p emerg..err` to filter journal log entries in Linux

### Managing Log File Sizes
- Run `sudo nano /etc/logrotate.conf` to edit the rotation scheme of the configuration file
- Configure log rotation scheme that backs up authentication information to the */var/log/auth.log* directory
- Rotation scheme:
        `/var/log/auth.log{
         weekly
         rotate 7
         notifempty
         delaycompression
         missingok
         }`

### Checking for Policy & File Violations
- Verify *auditid* is active with `systemctl status auditid`
- Set number of retained logs and maximum log file size:
	* Edits to configuration:
	  ` num_logs = 7
	    ...
	    max_log_file = 35
	  `
- Use *auditid* to set rules for */etc/shadow*, */etc/passwd*, and */var/log/auth.log*:
	* Edits to the *rules* file:
	` -w /etc/shadow -p wra -k hashpass_audit
	  -w /etc/passwd -p wra -k userpass_audit
	  -w /var/log/auth.log -p wra -k authlog_audit
	`
- Restart *auditid* with `sudo systemctl restart auditid`
- List all *auditid* rules with `sudo auditctl -l`
- Produce audit report with `sudo aureport -au`
- Create a user with `sudo useradd attacker` and produce an audit report that lists account modifications: `sudo aureport -m`
	* Output:
	  Account Modifications Report
	  =================================================
	  # date time auid addr term exe acct success event
	  =================================================
	  1. 04/28/2023 14:15:50 -1 ? ? /usr/sbin/useradd vboxadd no 234
	  2. 04/28/2023 14:15:50 -1 ? ? /usr/sbin/useradd vboxadd no 235
	  3. 04/28/2023 14:15:50 -1 ? ? /usr/sbin/useradd vboxadd no 236
	  4. 04/28/2023 14:15:50 -1 ? ? /usr/sbin/useradd vboxadd no 237
	  5. 04/28/2023 15:40:31 1000 UbuntuDesktop pts/0 /usr/sbin/useradd attacker yes 9286
	  6. 04/28/2023 15:40:31 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 9290
	 `
- Use *auditid* to monitor */var/log/cron*: `sudo auditctl -w /var/log/cron -p wra -k cron_log`
- Verify *auditid* rules with `sudo auditctl -l`

