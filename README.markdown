# vim config

Principally inspired by [Marc's vim config](https://github.com/marcw/vim-config)

## Installation procedure

### Unix like systems

In order to install this config follow this steps:

    cd ~/
    git clone git@github.com:odolbeau/vim-config.git
    ln -s ~/vim-config/_vimrc ~/.vimrc
    ln -s ~/vim-config/vim ~/.vim
    cd ~/vim-config
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
