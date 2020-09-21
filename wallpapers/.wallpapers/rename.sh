#!/bin/sh

if [ "$#" -ne 1 ]
then
    echo "Usage: specify dir"
    exit 1
fi

dir=$1
cd $dir

echo "Renaming all files in $dir."
COUNTER=1
for i in `find ${dir} -type f -name "*.jpg" -o -name "*.png"`
do
    extension=${i##*.}
    mv "$i" "$(printf "wallpaper_%0.3d.$extension" $COUNTER)"
    echo "$i ==> $(printf "wallpaper_%0.3d.$extension" $COUNTER)"
    COUNTER=$(expr $COUNTER + 1 )
done

