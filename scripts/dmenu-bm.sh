# List all bookmarks in BM

load() {
	cat ~/bm.lnk | awk -F\| '{ print $5, $4, $6, $7}' 
	printf "Add"
}

declare -A bookmarks 
bookmarksDisplay=()

result=`load | dmenu -i -l 15 -p "Add/Open bookmark:"`
echo $result[0]
echo $result[1]
echo $result[2]
case "$result" in
	Add) ~/source/dotfiles/scripts/dmen-bm-add.sh ;;
	*) bm -o $result;;
esac
# Have Add function
