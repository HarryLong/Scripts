#!/bin/bash
# Script to perform backups of important file systemsconvert flv videos into mp3's

logfile=/var/log/backup.log
backup_storage=/media/D13B-FEFA/BACKUP/

exec > $logfile 2>&1

if [ -d $backup_storage ]; then
	echo -n "Performing backup of home folder..."
	rsync -av --delete /home/harry $backup_storage
	echo "Done!"
	echo -n "Performing backup of etc folder..."
	rsync -av --delete /etc $backup_storage
	echo "Done!"
else
	echo "External storage not present... Aborting backup\n"
fi

