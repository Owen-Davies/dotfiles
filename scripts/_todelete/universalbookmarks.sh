#!/bin/bash
INFO() {
    cat <<EOF>&2
### DEPENDS ON ###
     "surfraw"-for keyword based search, you will need /usr/lib/surfraw in your path, so add below line to your .bashrc (uncommented)
     PATH=/usr/lib/surfraw:${PATH}
     "trans" for language translations, https://github.com/soimort/translate-shell
     "sdcv" for dictionary support
### CONFIGURATION ###
     place your browser in BROWSER=? line
	 place your bookmarks text file with 1 url/line, put it in "BOOKMARKS=?" field 
     default script uses rofi, to use dmenu uncomment the line starting with dmenu and comment out previous line starting with rofi
### USE ###
     enter text in rofi/dmenu field, it will be matched against bookmarks, <enter> to open selected bookmark
     to search specific sites use keyword as first argument ( like go for google, wi for wikipedia, aw for archwiki etc.) > read the script to find out all keywords
     to find out route from delhi to mumbai with google map, "nav delhi mumbai" or to search a location only use "map <location>"
     if no keyword or url is used, entire argument will be searched with duckduckgo
     to search with input text only (not matching bookmark) use <C-enter> (rofi only)
     to edit selected bookmark use <C-space> (rofi only)
EOF
}
while getopts h: help; do
    case $help in
    h|\?) INFO && exit ;;
esac
done
shopt -s lastpipe
## Add name of your browser here ( not text-browsers )
BROWSER=firefox
## add your plain text bookmarks here, you can add tag after the bookmark bookmart url e.g., "www.google.co.in search googlesearch", use "link-handler" for adding bookmarks
BOOKMARKS=~/bookmarks/bookmarks
# use rofi to display bookmarks and select one
#rofi -dmenu -location 1 -l 10 -width 100 -font "Inconsolata 14" -p $BROWSER < "$BOOKMARKS" | read -a "url"

## use dmenu inplace of rofi
url=$(dmenu -l 10 -fn "Inconsolata 14" -p $BROWSER: < "$BOOKMARKS")

[[ ! $url ]] 

duckimage() {
x=$@
$BROWSER "https://duckduckgo.com/?q=${x// /+}&ia=images&iax=1"
}
duckvideo() {
x=$@; $BROWSER "https://duckduckgo.com/?q=${x// /+}&ia=videos&iax=1"
}
DDG() {
x=$@; $BROWSER "https://duckduckgo.com/?q=${x// /+}"
}
MED() {
x=$@; $BROWSER "http://medical-dictionary.thefreedictionary.com/${x// /+}"
}
FLIPKART() {
x=$@; $BROWSER "https://www.flipkart.com/search?q=${x// /+}"
}
NAV() {
$BROWSER "https://maps.google.com/maps?saddr=$1&daddr=$2"
}
case "${url[0]}" in
    *.*|*:*|*/*)		    $BROWSER "${url[0]}" ;;
    aw|awiki)   archwiki    -browser=$BROWSER "${url[@]:1}" ;;
    wi|wiki)    wikipedia   -browser=$BROWSER "${url[@]:1}" ;;
    imdb)	    imdb        -browser=$BROWSER "${url[@]:1}" ;;
    aur)	    aur         -browser=$BROWSER "${url[@]:1}" ;;
    pkg)	    archpkg     -browser=$BROWSER "${url[@]:1}" ;;
    ddg|S|DDG)	DDG			"${url[@]:1}" ;;
    go|google)  google      -browser=$BROWSER "${url[@]:1}" ;;
    map)        google -m   -browser=$BROWSER "${url[@]:1}" ;;
    nav)	    NAV "${url[1]}" "${url[2]}" ;;
#    image)	google -i   -browser=$BROWSER "${url[@]:1}" ;;   
    image)      duckimage   "${url[@]:1}" ;;   
#    video)	google -v   -browser=$BROWSER "${url[@]:1}" ;;   
    video)      duckvideo   "${url[@]:1}" ;;
    news)	    google -n   -browser=$BROWSER "${url[@]:1}" ;;      
    yt|youtube)	youtube     -browser=$BROWSER "${url[@]:1}" ;;
    ebay)	    ebay        -browser=$BROWSER "${url[@]:1}" ;;
    fk|flipkart) FLIPKART   "${url[@]:1}" ;;
    pubmed)	    pubmed      -browser=$BROWSER "${url[@]:1}" ;;
    git|github)	github      -browser=$BROWSER "${url[@]:1}" ;;
esac
