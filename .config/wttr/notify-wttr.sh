#! /bin/bash 

source ~/.config/wttr/wttr.sh

FILE=/tmp/lastWttr
ACTUAL_TIME=$(date +%s)
FILE_TIME=$(stat -c %Y $FILE 2> /dev/null)

if [ -n "$FILE_TIME" ]; then 
	DIFERENCIA=$(( ACTUAL_TIME - FILE_TIME ))
	if [ $DIFERENCIA -le 600 ]; then 
		notify-send "$(sed -n -e '1p' $FILE)" "$(sed -n -e '3,$p' $FILE)"
		exit 0
	fi 	
fi

wttr > $FILE 
notify-send "$(sed -n -e '1p' $FILE)" "$(sed -n -e '3,$p' $FILE)"
