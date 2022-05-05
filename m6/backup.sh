#!/bin/bash
# source: https://rtfm.co.ua/bash-funkciya-getopts-ispolzuem-opcii-v-skriptax/
#
# Create a data backup script that takes the following data as parameters:
# - Path to the syncing directory.
# - The path to the directory where the copies of the files will be stored.

#In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute] 

checkargs () {
if [[ $OPTARG =~ ^-[i/o]$ ]]
then
echo "Unknow argument $OPTARG for option $opt!"
exit 1
fi
}

while getopts "i:o:" opt
do
case $opt in
i) checkargs; 
	from="$OPTARG";;
o) checkargs;
	to="$OPTARG";;
e) 	ssh="$OPTARG";;
*) echo "No reasonable options found!";;
esac
done
echo "$from"
echo "$to"
echo "$ssh"
#if [ -n "$ssh" ]
#	rsync -avz --log-file=diff-ssh.log -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" user@ip:/"$to""
#fi
# 
rsync -acr --log-file=diff.log "$from" "$to"

#diff "$from" "$to" | awk -F: '{ print $2 }' | awk '{ print '$from'$1 }' > list   
#diff "$from" "$to" | awk -F: '{ print $2 }' > list
#tst=/sdf/sdf/; cat test | awk -b '{ "%s, %s" { printf '$tst'$1 } }' > for
#cat list
#cat list | xargs cp -t "$to"
#cat list
#awk -F: '{ print $2 }' source | awk '{ print $1 }'
