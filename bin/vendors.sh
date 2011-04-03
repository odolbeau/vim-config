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
    fi

    SRC="$VENDOR/$INSTALL_DIR"

    ls -l $SRC/doc/ | awk -v src=$SRC -v dir=$DIR/vim '$9 ~ /.+/ {print src"/doc/"$9" "dir"/doc/"$9;}' | xargs ln -s
    ls -l $SRC/plugin/ | awk -v src=$SRC -v dir=$DIR/vim '$9 ~ /.+/ {print src"/plugin/"$9" "dir"/plugin/"$9;}' | xargs ln -s
}

# NERDTree
install_git nerdtree git://github.com/scrooloose/nerdtree.git
ln -s nerdtree/nerdtree_plugin vim
