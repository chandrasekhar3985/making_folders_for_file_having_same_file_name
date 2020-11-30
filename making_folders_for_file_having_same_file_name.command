#!/bin/bash
#Asking user where want to rename files or not
zenity --question --text='<span foreground="#ff1493" font="28">\n\n\n\n\n\nDo You want to make folder as per file name. \n\n And Move file into that Folder.</span>' --width="600" --height="500" --ok-label="SURE DO" --cancel-label="NOT NOW"
if [ $? == 1 ]; then exit; fi
#Asking User to Select the Source folder (sf)
sf=$(zenity --file-selection --directory --title='Choose Source Directory')
if [ $? == 1 ]; then exit; fi
cd "$sf"
for file in *
do
if [ -f "$file" ]
then
echo "$file"
fl=`echo "$file" |rev | cut -f2- -d'.' | rev `
mkdir "$fl"
mv "$file" "$fl"
  fi
done
#echo "lets rename file"
