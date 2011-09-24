# vim config

Principally inspired by [Marc's vim config](https://github.com/marcw/vim-config)

## Installation procedure

### Unix like systems

In order to install this config follow this steps:

    $ cd ~/
    $ git clone git://github.com/odolbeau/vim-config.git
    $ git submodule update --init
    $ ln -s ~/vim-config/_vimrc ~/.vimrc
    $ ln -s ~/vim-config/vim ~/.vim

You have to build the command-t extension with the following command:

    $ cd ~/vim-config/vim/bunfle/command-t/
    $ rake make

It use ruby, so you have to install ruby-dev package (debian) or XCode (mac)
