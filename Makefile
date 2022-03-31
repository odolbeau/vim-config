.PHONY: ${TARGETS}

install:
	@if [ ! -L ${HOME}/.vimrc ]; then ln -s ${HOME}/vim-config/_vimrc ${HOME}/.vimrc; fi
	@if [ ! -L ${HOME}/.vim ]; then ln -s ${HOME}/vim-config/vim ${HOME}/.vim; fi
	@if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then git clone git@github.com:gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim; fi
	vim +PluginInstall +qall

update: install
	vim +PluginUpdate +qall
