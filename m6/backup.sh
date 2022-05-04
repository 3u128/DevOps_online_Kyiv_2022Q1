#!/bin/bash
# source: https://rtfm.co.ua/bash-funkciya-getopts-ispolzuem-opcii-v-skriptax/
#
# Create a data backup script that takes the following data as parameters:
# - Path to the syncing directory.
# - The path to the directory where the copies of the files will be stored.

#In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute] 

if [ -z $* ]
then
echo "No options found!"
exit 1
fi

checkargs () {
if [[ $OPTARG =~ ^-[a/b]$ ]]
then
echo "Unknow argument $OPTARG for option $opt!"
exit 1
fi
}


while getopts "a:b:" opt
do
case $opt in
a) checkargs; 
	echo "$OPTARG";;
b) checkargs;
	echo "$OPTARG";;
*) echo "No reasonable options found!";;
esac
done
