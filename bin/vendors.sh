# Install NERDTree
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
                ls -l $SRC/$FOLDER/ | awk -v src="$SRC/$FOLDER" -v dest="$DEST/$FOLDER" '$9 ~ /.+/ {print src"/"$9" "dest"/"$9;}' | xargs -L 1 ln -sf
            fi
        done
    fi

}

# NERDTree
install_git nerdtree git://github.com/scrooloose/nerdtree.git
ln -sf $VENDOR/nerdtree/nerdtree_plugin $DIR/vim/nerdtree_plugin

# SnipMate
install_git snipmate git://github.com/msanders/snipmate.vim.git
ln -sf $VENDOR/snipmate/after $DIR/vim/after
ln -sf $VENDOR/snipmate/autoload $DIR/vim/autoload
ln -sf $VENDOR/snipmate/ftplugin $DIR/vim/ftplugin

# Minibufexpl
install_git minibufexpl git://github.com/fholgado/minibufexpl.vim.git

# Bclose
ln -sf $RESOURCES/plugin/bclose.vim $DIR/vim/plugin

# NERDCommenter
install_git nerdcommenter git://github.com/scrooloose/nerdcommenter.git

# vim-markdown
install_git vim-markdown git://github.com/plasticboy/vim-markdown.git

# Syntax
ls -l $RESOURCES/syntax/ | awk -v src="$RESOURCES/syntax" -v dir="$DIR/vim/syntax" '$9 ~ /.+/ {print src"/"$9" "dir"/"$9;}' | xargs -L 1 ln -sf

# Colors
ls -l $RESOURCES/colors/ | awk -v src="$RESOURCES/colors" -v dir="$DIR/vim/colors" '$9 ~ /.+/ {print src"/"$9" "dir"/"$9;}' | xargs -L 1 ln -sf
