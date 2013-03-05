#!/bin/bash
#
# Installs the dotfiles into your home directory
#
# "x" means the file already exists. Delete the current one if you want to
#     install the new one
#
# "+" means the file was installed successfully
#
# "?" means there was a problem installing the file

SCRIPT=`basename $0`
DIR=$(cd `dirname $0` && pwd)

if [ ! -e $DIR/vim ]; then
  git clone git://github.com/carlhuda/janus.git $DIR/vim
  pushd $DIR/vim
  rake
  popd
fi

cd $HOME

for FILE in `ls -1 "$DIR" | grep -v "$SCRIPT"`
do
    DOTFILE=".$FILE"
    if [ -e "$HOME/$DOTFILE" ]
    then
        echo "x $DOTFILE"
    else
        ln -sv "$DIR/$FILE" "$DOTFILE"
        [ $? -eq 0 ] && echo "+ $DOTFILE" || echo "? $DOTFILE"
    fi
done

if [[ $OSTYPE == "darwin12" ]]; then
    echo "=> Installing OS X Fonts"
    FONTDIR="$DIR/Library/Fonts"
    for FONT in `ls $FONTDIR`; do
        TARGET="$HOME/Library/Fonts/$FONT"
        if [ -e "$TARGET" ]; then
            echo "x $TARGET"
        else
            cp "$FONTDIR/$FONT" "$TARGET"
            echo "+ $TARGET"
        fi
    done

    echo "=> Installing OS X Preferences"
    PREFSDIR="$DIR/Library/Preferences"
    for PREF in `ls $PREFSDIR`; do
        TARGET="$HOME/Library/Preferences/$PREF"
        if [ -e "$TARGET" ]; then
            echo "x $TARGET"
        else
            ln -s "$PREFSDIR/$PREF" "$TARGET"
            echo "+ $TARGET"
        fi
    done
fi
