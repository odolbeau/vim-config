NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"

DIR=`php -r "echo dirname(dirname(realpath('$0')));"`
VENDOR="$DIR/vendor"
RESOURCES="$DIR/resources"

# initialization
if [ "$1" = "--reinstall" ]; then
    rm -rf $VENDOR
fi

mkdir -p $DIR/vim/colors

mkdir -p "$VENDOR" && cd "$VENDOR"

##
# @param destination directory (e.g. "doctrine")
# @param URL of the git remote (e.g. git://github.com/doctrine/doctrine2.git)
# @param revision to point the head (e.g. origin/HEAD)
#
install_git()
{
    INSTALL_DIR=$1
    SOURCE_URL=$2

    if [ ! -d $INSTALL_DIR ]; then
        git clone $SOURCE_URL $INSTALL_DIR

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
    fi

}

echo_action()
{
    echo -e "$ROUGE$1$NORMAL"
}

# NERDTree
echo_action "Installing NERDTree..."
install_git nerdtree git://github.com/scrooloose/nerdtree.git
ln -sf $VENDOR/nerdtree/nerdtree_plugin $DIR/vim/nerdtree_plugin

# SnipMate
echo_action "Installing Snipmate..."
install_git snipmate git://github.com/msanders/snipmate.vim.git
ln -sf $VENDOR/snipmate/after $DIR/vim/after
ln -sf $VENDOR/snipmate/autoload $DIR/vim/autoload
ln -sf $VENDOR/snipmate/ftplugin $DIR/vim/ftplugin

# Minibufexpl
echo_action "Installing Minibufexpl..."
install_git minibufexpl git://github.com/fholgado/minibufexpl.vim.git

# Bclose
echo_action "Installing Bclose..."
ln -sf $RESOURCES/plugin/bclose.vim $DIR/vim/plugin

# NERDCommenter
echo_action "Installing NerdCommenter..."
install_git nerdcommenter git://github.com/scrooloose/nerdcommenter.git

# vim-markdown
echo_action "Installing vim-markdown..."
install_git vim-markdown git://github.com/plasticboy/vim-markdown.git

# Syntax
echo_action "Copiyng Syntax folder..."
ls -1 $RESOURCES/syntax/ | awk -v src="$RESOURCES/syntax" -v dir="$DIR/vim/syntax" '$1 ~ /.+/ {print src"/"$1" "dir"/"$1;}' | xargs -L 1 ln -sf

# Colors
echo_action "Copiyng Colors folder..."
ls -1 $RESOURCES/colors/ | awk -v src="$RESOURCES/colors" -v dir="$DIR/vim/colors" '$1 ~ /.+/ {print src"/"$1" "dir"/"$1;}' | xargs -L 1 ln -sf
