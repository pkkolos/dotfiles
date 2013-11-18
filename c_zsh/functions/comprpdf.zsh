function comprpdf() {
	local quality
	local output
	local list

	quality="default"
	list=("default" "screen" "ebook" "printer" "prepress")

	if [[ $# -eq 0 ]]; then
		echo "Usage:"
		echo "    mkpdf -l"
		echo "or  mkpdf [-q <quality>] -o <output_file> <input_file>"
		return 1
	fi

	while getopts ":lq::o:" optname; do
		case $optname in
			l) echo "[default,screen,ebook,printer,prepress]"; return 0;;
			q) quality=$OPTARG;;
			o) output=$OPTARG;;
			:) echo "Missing option argument for -$OPTARG" >&2; return 2;;
			*) echo "Unknown option" >&2; return 3;;
		esac
	done
	shift $((OPTIND-1))
	unset optname

	if [[ ${list[(i)$quality]} -gt ${#list} ]]; then
		echo "Unknown option argument for -q"
		echo "Use mkpdf -l to see supported arguments"
		return 4
	fi

	if [[ -z "$output" ]]; then
		echo "Missing option -o <output_file>"
		return 5
	fi

	if [[ ! -f "$1" ]]; then
		echo "mkpdf: '$1' is not a valid file" 1>&2
		return 6
	fi

	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
		-dPDFSETTINGS=/$quality -dNOPAUSE -dQUIET \
		-dBATCH -sOutputFile=$output $1
}
