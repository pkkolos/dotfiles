#!/bin/bash

if [ "$1" = "gmail" ]; then
    mail="$(conkyEmail -m IMAP --ssl -s imap.gmail.com -u <gmail> --connectiontimeout=20)" ;
elif [ "$1" = "outlook" ]; then
    mail="$(conkyEmail -m IMAP --ssl -s imap-mail.outlook.com -u <outlook> --connectiontimeout=20)" ;
fi

if [ "$mail" = "0" ]; then
    mail="No new mail" ;
elif [ "$mail" = "1" ]; then
    mail="1 new mail" ;
elif [[ "$mail" =~ ^[0-9]+$ ]]; then
    mail="$mail new mails" ;
else
    mail="Error!" ;
fi

echo "$mail"

exit 0
