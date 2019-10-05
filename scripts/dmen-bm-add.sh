#!/bin/sh

result() {
	echo -n | dmenu -p "$1"
}


url="$(result "URL:")"
title="$(result "Title:")"
tags="$(result "Tags (comma delimited):")"

bm -a  $url -T "$title" -t "$tags"
