#! /bin/sh

num="`find ~/.local/share/Trash/files -type f | wc -l`"
if [ "$num" = "0" ]; then
	{
	echo 'Empty'
	}
elif [ "$num" = "1" ]; then
	{
	echo '1 File'
	}
else
	{
	echo $num' Files'
	}
fi

exit 0
