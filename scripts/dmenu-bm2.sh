#!/bin/sh

declare -A bookmarks 
bookmarksDisplay=()

while IFS=\| read -r guid date id url title tags;
do
	bookmark="$title "-" "$url" "-" "$tags""
	bookmarks["$bookmark"]="$url"
	bookmarksDisplay+="$bookmark\n"
done < ~/bm.lnk 
bookmarksDisplay+="Add"


load() {
	for i in "${bookmarksDisplay[@]}" 
	do 
		printf $i
	done
}

choice=`load | dmenu -i -l 15 -p "Add/Open bookmark:"`
# load | dmenu -p "Bookmarks"
 

#choice=$(echo -e "$bookmarksDisplay" | dmenu -i -l 15 -p "Add/Open bookmark:" )

#case "$choice" in
#	Add) ~/source/dotfiles/scripts/dmen-bm-add.sh ;;
#	*) bm -o ${bookmarks["$choice"]};;
#esac
