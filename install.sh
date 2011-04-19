#!/bin/bash

SCRIPT=`basename $0`
DIR=`dirname $0`
cd $DIR

for FILE in `ls -d1 * | grep -v "$SCRIPT"`
do
    DOTFILE=".$FILE"
    if [ -e "$HOME/$DOTFILE" ]
    then
        echo "x $DOTFILE"
    else
        (cd ..; ln -s "$DIR/$FILE" "$DOTFILE")
        [ $? -eq 0 ] && echo "+ $DOTFILE" || echo "? $DOTFILE"
    fi
done
