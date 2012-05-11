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
