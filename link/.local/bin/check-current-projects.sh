#!/bin/bash

base_dir="/home/bazin_q/rendu"

for project in $(cat "$base_dir/current")
do
	cd "$base_dir"
	
	if [ ! -d "$project" ]
	then
		notify-send -u critical -t 5000 "$(pwd)/$project" "Folder not found"
		continue
	fi
	
	cd "$project"
	
	norm_errors=$(python2 /home/bazin_q/.local/bin/gistfile1.py $(find . -name '*.c' -or -name '*.h' -or -name 'Makefile' | grep -v "tests-") | tail -1 | awk '{print $2*-1}');
	if [ $norm_errors -gt 0 ]
	then
		notify-send -u critical -t 10000 "$(basename $(pwd))" "You have $norm_errors norm errors."
	else
		notify-send -u normal -t 2000 "$(basename $(pwd))" "You have $norm_errors norm errors."
	fi
done
