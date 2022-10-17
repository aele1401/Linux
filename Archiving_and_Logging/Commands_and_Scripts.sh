# Creating, Extracting, Compressing, Managing tar Backup Archives
# Download tar file and move it to home directory
# Tar commands:
tar cvvWf Javeless_Doc.tar TarDocs/home/sysadmin/Projects/TarDocs/Documents/Java
tar cvf Javaless_Docs.tar --exclude="Java" /home/sysadmin/Projects/TarDocs

# Creating, Managing, and Automating Cron Jobs
cron job = 0 6 * * 3 ./authlog_backup_script"authlog_backup_script" tar cf logs_backups.tar /var/log/auth.log ()end

# Bash Scripts
mkdir backups/ {freemem,diskuse,openlist,freedisk}

# system script
nano system.sh
free -h > ~/backups/freemem/free_mem.txt
du -h > ~/backups/diskuse/disk_use.txt
lsof > ~/backups/openlist/open_list.txt
df -h > ~/backups/freedisk/free_disk.txt

# Performing various log filtering techniques
journalctl -p emerg..err

# Managing log file sizes
# Rotation scheme:
/var/log/auth.log{
    weekly
    rotate 7
    notifempty
    delaycompression
    missingok
}

