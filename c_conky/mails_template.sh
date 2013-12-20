#! /bin/bash

if [ "$1" = "gmail" ]; then
	MAIL=`conkyEmail -m IMAP --ssl -s imap.gmail.com -u <gmail> --connectiontimeout=20` ;
elif [ "$1" = "outlook" ]; then
	MAIL=`conkyEmail -m IMAP --ssl -s imap-mail.outlook.com -u <outlook> --connectiontimeout=20` ;
	#MAIL=`conkyEmail --ssl -s pop3.live.com -u <outlook> --connectiontimeout=20` ;
fi

if [ "$MAIL" = "0" ]; then
	MAIL='${color2}No new mail${color}' ;
elif [ "$MAIL" = "1" ]; then
	MAIL='${color3}1 new mail${color}' ;
elif [[ "$MAIL" =~ ^[0-9]+$ ]]; then
	MAIL='${color3}'$MAIL' new mails${color}' ;
else
	MAIL='${color4}Error!${color}' ;
fi

echo $MAIL

exit 0
