# Install NERDTree
DIR=`php -r "echo dirname(dirname(realpath('$0')));"`
VENDOR="$DIR/vendor"

# initialization
if [ "$1" = "--reinstall" ]; then
    rm -rf $VENDOR
fi

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

        if [ -d $SRC/doc/ ]; then
            ls -l $SRC/doc/ | awk -v src=$SRC -v dir=$DEST '$9 ~ /.+/ {print src"/doc/"$9" "dir"/doc/"$9;}' | xargs ln -sf
        fi
        if [ -d $SRC/plugin/ ]; then
            ls -l $SRC/plugin/ | awk -v src=$SRC -v dir=$DEST '$9 ~ /.+/ {print src"/plugin/"$9" "dir"/plugin/"$9;}' | xargs ln -sf
        fi
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
ln -sf $VENDOR/snipmate/snippets $DIR/vim/snippets
ln -sf $VENDOR/snipmate/syntax $DIR/vim/syntax

# Minibufexpl
install_git minibufexpl git://github.com/fholgado/minibufexpl.vim.git

# Bclose
ln -sf $VENDOR/bclose/bclose.vim $DIR/vim/plugin

# NERDCommenter
install_git nerdcommenter git://github.com/scrooloose/nerdcommenter.git
