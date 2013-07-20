# vim config

Principally inspired by [Marc's vim config](https://github.com/marcw/vim-config)

## Installation procedure

### Unix like systems

In order to install this config follow this steps:

    $ cd ~/
    $ git clone git@github.com:odolbeau/vim-config.git
    $ ln -s ~/vim-config/_vimrc ~/.vimrc
    $ ln -s ~/vim-config/vim ~/.vim
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ vim +BundleInstall +qall

You have to build the command-t extension with the following command:

    $ cd ~/vim-config/vim/bundle/command-t/ruby/command-t
    $ ruby extconf.rb
    $ make

It use ruby, so you have to install ruby-dev package (debian) or XCode (mac)
