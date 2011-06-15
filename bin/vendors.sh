#!/bin/bash
NORMAL="\\033[0;39m"
RED="\\033[1;31m"

DIR=`dirname $(readlink -f /proc/$$/fd/255)`/../
VENDOR="$DIR/vendor"
RESOURCES="$DIR/resources"

mkdir -p $DIR/vim/colors

##
# @param destination directory (e.g. "doctrine")
# @param URL of the git remote (e.g. git://github.com/doctrine/doctrine2.git)
# @param revision to point the head (e.g. origin/HEAD)
#
install_vendor()
{
    INSTALL_DIR=$1


        SRC="$VENDOR/$INSTALL_DIR"
        DEST="$DIR/vim"

        FOLDERS=( doc plugin syntax ftdetect snippets )

        for FOLDER in ${FOLDERS[@]}
        do
            mkdir -p $DIR/vim/$FOLDER
            if [ -d $SRC/$FOLDER ]; then
                ls -1 $SRC/$FOLDER/ | awk -v src="$SRC/$FOLDER" -v dest="$DEST/$FOLDER" '$1 ~ /.+/ {print src"/"$1" "dest"/"$1;}' | xargs -L 1 ln -sf
            fi
        done
}

echo_action()
{
    echo -e "$RED$1$NORMAL"
}

# NERDTree
echo_action "Installing Nerdtree..."
install_vendor nerdtree
ln -sf $VENDOR/nerdtree/nerdtree_plugin $DIR/vim/nerdtree_plugin

# SnipMate
echo_action "Installing Snipmate..."
install_vendor snipmate
ln -sf $VENDOR/snipmate/after $DIR/vim/after
ln -sf $VENDOR/snipmate/autoload $DIR/vim/autoload
ln -sf $VENDOR/snipmate/ftplugin $DIR/vim/ftplugin

# Minibufexpl
echo_action "Installing Minibufexpl..."
install_vendor minibufexpl

# Bclose
echo_action "Installing Bclose..."
ln -sf $RESOURCES/plugin/bclose.vim $DIR/vim/plugin

# NERDCommenter
echo_action "Installing NerdCommenter..."
install_vendor nerdcommenter

# vim-markdown
echo_action "Installing vim-markdown..."
install_vendor vim-markdown

# Syntax
echo_action "Copiyng Syntax folder..."
ls -1 $RESOURCES/syntax/ | awk -v src="$RESOURCES/syntax" -v dir="$DIR/vim/syntax" '$1 ~ /.+/ {print src"/"$1" "dir"/"$1;}' | xargs -L 1 ln -sf

# Colors
echo_action "Copiyng Colors folder..."
ls -1 $RESOURCES/colors/ | awk -v src="$RESOURCES/colors" -v dir="$DIR/vim/colors" '$1 ~ /.+/ {print src"/"$1" "dir"/"$1;}' | xargs -L 1 ln -sf
