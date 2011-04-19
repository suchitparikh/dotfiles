#!/bin/bash

SCRIPT=`basename $0`
DIR=$(cd `dirname $0` && pwd)
cd $HOME

for FILE in `ls -1 "$DIR" | grep -v "$SCRIPT"`
do
    DOTFILE=".$FILE"
    if [ -e "$HOME/$DOTFILE" ]
    then
        echo "x $DOTFILE"
    else
        ln -s "$DIR/$FILE" "$DOTFILE"
        [ $? -eq 0 ] && echo "+ $DOTFILE" || echo "? $DOTFILE"
    fi
done
