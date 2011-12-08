" Basics
    set nocompatible                        " Use defauts Vim

" Pathogen install
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()

" General
    filetype on
    filetype plugin indent on

" Encoding
    set ff=unix                             " Unix EOL
    set fileencoding=UTF-8                  " Speak UTF-8
    set encoding=UTF-8                      " Display UTF-8

" Color
    syntax enable
    set background=dark                     " dark background is better!
    let php_sql_query = 1                   " SQL queries
    let php_htmlInStrings = 1               " HTML
    if has('gui_running')
        set guifont=Monospace\ 8
        let g:solarized_style="light"
        let g:solarized_contrast="high"
        colorscheme solarized
    else
        colorscheme desertEx
    endif

" UI
    set cursorline                          " Highlight the current line
    set scrolloff=8                         " Keep x line for scope while scrolling
    set sidescrolloff=8                     " same same
    set showmatch                           " Show matching bracket

" Completion
    set wildmenu
    set wildmode=list:longest               " Complete files like a shell.

" Statusline
    set number                              " Show line numbers in gutter
    set ruler                               " Always show current position along the bottom
    set showcmd                             " Show the command being typed

    set laststatus=2

    set statusline=%<%f\                    " Filename
    set statusline+=%w%h%m%r                " Options
    set statusline+=\ [%{&ff}/%Y]           " Show filetype in statusline
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Editor
    set bs=indent,eol,start                 " Backspace works everywhere
    set ruler                               " Show current cursor position
    set history=50                          " command history size
    set noerrorbells                        " Stop the noise!!
    set list
    set listchars=trail:¤,tab:>-            " Show blank spaces and tabs at the end of a line

" Search
    " set incsearch                           " Highlight matches as you type.
    set hlsearch                            " Highlight matches.
    " set ignorecase                          " Case-insensitive searching.
    " set smartcase                           " But case-sensitive if expression contains a capital letter.

" Indentation
    set autoindent                          " Automatic indentation
    set softtabstop=4                       " tab = 4 space
    set shiftwidth=4
    set expandtab                           " no more tabs, only spaces!
    set shiftround                          " when at 3 spaces, and I hit > ... go to 4, not 7

" Keymap
    " Changing leader
    let mapleader   = ","
    let g:mapleader = ","

    " Delete trailing spaces
    nmap <silent> <C-F10> :%s/\s\+$//g<CR>
    nmap <silent> <C-S-F10> :%s/^\s\+$//g<CR>

    " Insert php namespace
    nmap <silent> <C-F9> <ESC>"%PdF/r;:s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]
    " Insert php namespace and create class name
    nmap <silent> <C-S-F9> ggO<?php<CR><CR><ESC>"%PdF/r;:s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]<CR>Goclass <C-R>=expand("%:t:r")<CR><CR>{<CR>

    nnoremap <F2> :NERDTreeToggle<CR>
    nnoremap <F3> :TlistToggle<CR>

" NERDTree
    let g:NERDTreeWinPos = "right"

" MiniBufXplorer settings
    let g:miniBufExplMaxSize=2              " set max size to 2 lines
    let g:miniBufExplMapWindowNavVim= 1     " Navigate trough buffers with Control + [hjkl]
    let g:miniBufExplMapWindowNavArrows=1   " Navigate trough buffers with Control + Arrow Keys
    let g:miniBufExplMapCTabSwitchBufs=1    " Navigate trough buffers with <C-TAB> and <C-S-TAB>
    let g:miniBufExplModSelTarget=1         " Hide others explorers out of MBE
    let g:miniBufExplSplitBelow=0           " Put new window above current or on the left for vertical split
    " Minibufexpl with ,q is better than :Bclose :)
    noremap <leader>q :Bclose<CR>
    noremap <leader>q! :Bclose!<CR>

" TagList settings
    let Tlist_Auto_Open=0
    let Tlist_Use_Right_Window=0
    let Tlist_Sort_Type = "name" " order by
    let tlist_php_settings = 'php;c:class;d:constant;f:function' " don't show variables in php

" PDV
    let g:pdv_cfg_Author = "Olivier Dolbeau <contact@odolbeau.fr>"
    let g:pdv_cfg_Version = ""
    nnoremap <leader>d :call PhpDocSingle()<CR>
    vnoremap <leader>d :call PhpDocRange()<CR>

" twig
    autocmd BufRead *.twig set filetype=htmltwig
    autocmd BufRead *.phps set filetype=php
    autocmd BufRead *.phpd set filetype=php

" use :W to force save when forgot to open file in root
    command W w !sudo tee % > /dev/null
