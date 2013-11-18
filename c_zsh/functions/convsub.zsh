function convsub() {
	local temp=$( mktemp )
	iconv -f windows-1253 -t utf8 $1 -o $temp
	mv $temp $1
}
