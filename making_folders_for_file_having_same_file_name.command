#!/bin/bash
#Asking user where want to rename files or not
zenity --question --text='Do you like create a folder as per file name and move file in to that folder' --ok-label=SureDo --cancel-label=NotNow
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
