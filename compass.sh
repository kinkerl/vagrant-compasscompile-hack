#!/bin/bash

#################################
#e.g. export SCSS_FOLDER="assets/scss"
export SCSS_FOLDER="PATH-TO-YOUR-SCSS"
#e.g. export COMMAND="cd /vagrant && compass compile"
export COMMAND="COMMAND-TO-EXECUTE-WHEN-CONNECTING-TO-VAGRANT"

#################################
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
touch .checkpoint
while true; do
	if [[ -n $(find $SCSS_FOLDER -newer .checkpoint) ]]; then
		touch .checkpoint
		echo "+"
		notify-send "compile: START"
		date1=$(date +"%s")
		#hack because vagrant ssh -c does not work properly
		vagrant ssh-config > .vagrant-ssh
	    ssh -F .vagrant-ssh default  $COMMAND
	    date2=$(date +"%s")
		diff=$(($date2-$date1))
		notify-send -i "${DIR}/success.png" "compile: DONE in ${diff}s "
	else
    	echo -n "."
	fi
	sleep 1
done