#!/usr/bin/env bash
#
# The following prints the free memory to the specified file.
#
free -m | grep Mem | awk -v timestamp="$(date)" '{print timestamp,"-->",$4,"MB"}' >> ~/backups/freemem/free_mem.txt

#
# The following logs the average of five reports of the "mpstat" command
# with one second intervals between reports
#
mpstat 1 5 | awk -v timestamp="$(date)" 'END{print timestamp,"-->",100-$NF"%"}' >> ~/backups/diskuse/disk_usage.txt

#
# The following logs both the number of open files and the open files. I
# that was more interesting than simply all the open files.
#
echo "$(date) --> $(lsof | wc -l)" >> ~/backups/openlist/open_list_count.txt
echo "$(date) --> all open files:" >> ~/backups/openlist/open_list.txt
lsof >> ~/backups/openlist/open_list.txt

#
# The following logs the disk statistics for the disk mounted on "/".
#
echo "$(date) --> disk stats for filesystem mounted on '/':" >> ~/backups/freedisk/free_disk.txt
df -h / >> ~/backups/freedisk/free_disk.txt
