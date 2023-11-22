#!/bin/bash

PICTURE_EXTENSIONS=("jpg" "jpeg" "webp" "mp4" "mp4_" "mkv")

for fullfile in *; do 
    filename=$(basename -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    for e in "${PICTURE_EXTENSIONS[@]}"; do 
        if [[ "$extension" == "$e" ]]; then
            res=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$fullfile")
            printf "%-50s %s\n" "$fullfile" "$res"
        fi
    done
done
