#!/bin/bash

if [ "$1" = "gmail" ]; then
    mail="$(conkyEmail -m IMAP --ssl -s imap.gmail.com -u <gmail> --connectiontimeout=20)" ;
elif [ "$1" = "outlook" ]; then
    mail="$(conkyEmail -m IMAP --ssl -s imap-mail.outlook.com -u <outlook> --connectiontimeout=20)" ;
    #mail="$(conkyEmail --ssl -s pop3.live.com -u <outlook> --connectiontimeout=20)" ;
fi

if [ "$mail" = "0" ]; then
    mail='${color2}No new mail${color}' ;
elif [ "$mail" = "1" ]; then
    mail='${color3}1 new mail${color}' ;
elif [[ "$mail" =~ ^[0-9]+$ ]]; then
    mail='${color3}'"$mail"' new mails${color}' ;
else
    mail='${color4}Error!${color}' ;
fi

echo "$mail"

exit 0
