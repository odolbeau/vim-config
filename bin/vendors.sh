# Install NERDTree
DIR=`php -r "echo dirname(dirname(realpath('$0')));"`
VENDOR="$DIR/vendor"

# initialization
if [ "$1" = "--reinstall" ]; then
    rm -rf $VENDOR
fi

mkdir -p "$VENDOR" && cd "$VENDOR"


link()
{
    SRC=$1
    DEST=$2

    if [ ! -e $DEST ]; then
        ln -s $1 $2
    fi
}

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

        ls -l $SRC/doc/ | awk -v src=$SRC -v dir=$DEST '$9 ~ /.+/ {print src"/doc/"$9" "dir"/doc/"$9;}' | xargs link
        ls -l $SRC/plugin/ | awk -v src=$SRC -v dir=$DEST '$9 ~ /.+/ {print src"/plugin/"$9" "dir"/plugin/"$9;}' | xargs link
    fi

}

# NERDTree
install_git nerdtree git://github.com/scrooloose/nerdtree.git
link $VENDOR/nerdtree/nerdtree_plugin $DIR/vim/nerdtree_plugin

# SnipMate
install_git snipmate https://github.com/msanders/snipmate.vim.git
link $VENDOR/snipmate/after $DIR/vim/after
link $VENDOR/snipmate/autoload $DIR/vim/autoload
link $VENDOR/snipmate/ftplugin $DIR/vim/ftplugin
link $VENDOR/snipmate/snippets $DIR/vim/snippets
link $VENDOR/snipmate/syntax $DIR/vim/syntax
