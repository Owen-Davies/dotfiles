#!/bin/bash

shopt -s lastpipe
## Add name of your browser here ( not text-browsers )
BROWSER=firefox

## add your plain text bookmarks here, you can add tag after the bookmark bookmart url e.g., "www.google.co.in search googlesearch", use "link-handler" for adding bookmarks
BOOKMARKS=~/bookmarks/bookmarks

## use dmenu inplace of rofi
new_array=$(dmenu -l 10 -fn "Inconsolata 14" -p $BROWSER: < "$BOOKMARKS") 


#[[ ! $url  ]]

echo ${url[@]}
echo ${new_array[0]}
echo ${new_array[@]}
