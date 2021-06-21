#!/bin/bash
clear
#script to download Youtube videos to mp3,m4a,mp4
 
# Usage
# install Termux and setup the tool 
#for simplicity converting to mp3 is done by pressing enter after sharing video to Termux
clear
 
echo "For audio m4a audio only press 1"
echo "For video 360p press 2"
echo "For video 480p press 3"
echo "For video 720p press 4"
echo "For video 1080p press 5"
 
command='--external-downloader aria2c --external-downloader-args \"-j 16 -s 16 -x 16 -k 5M\" --no-mtime -o /data/data/com.termux/files/home/storage/shared/Movies/%(title)s.%(ext)s -f'
read option
 
if [ "$option" -eq "1" ]
then
    clear
    echo "--external-downloader aria2c --external-downloader-args \"-j 16 -s 16 -x 16 -k 5M\" --no-mtime -o /data/data/com.termux/files/home/storage/shared/Music/%(title)s.%(ext)s -f bestaudio[ext=m4a] --audio-format mp3 --prefer-ffmpeg" > ~/.config/youtube-dl/config
    youtube-dl $1
elif [ "$option" -eq "2" ]
then
    clear
    echo "$command \"best[height<=360]\"" > ~/.config/youtube-dl/config
    youtube-dl $1
 
elif [ "$option" -eq "3" ]
then
    clear
    echo "$command \"best[height<=480]\"" > ~/.config/youtube-dl/config
    youtube-dl $1
 
elif [ "$option" -eq "4" ]
then
    clear
    echo "$command \"best[height<=720]\"" > ~/.config/youtube-dl/config
    youtube-dl $1
 
elif [ "$option" -eq "5" ]
then
    clear
    echo "$command \"best[height<=1080]\"" > ~/.config/youtube-dl/config
    youtube-dl $1
fi
