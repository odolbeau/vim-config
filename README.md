# vim config

## Installation

In order to install this config follow this steps:

```bash
cd ~/
git clone git@github.com:odolbeau/vim-config.git
ln -s ~/vim-config/_vimrc ~/.vimrc
ln -s ~/vim-config/vim ~/.vim
cd ~/vim-config
git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

## Post installation

You will need to download [refactor.phar](https://github.com/QafooLabs/php-refactoring-browser).
Put it in `/usr/local/bin/refcator.phar` or read [installation documentation](https://github.com/vim-php/vim-php-refactoring)

You also need to generate tags :

```bash
ctags -R --PHP-kinds=+cf -f tags.vendors vendor
ctags -R --PHP-kinds=+cf src
```
