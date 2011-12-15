" Basics
    set nocompatible                        " Use defauts Vim
    filetype off                            " deactivate filetype for pathogen to load snipmate correctly

" Pathogen install
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()

    filetype plugin indent on               " reactivate filetype

" filetype
    autocmd BufRead *.twig set filetype=htmltwig
    autocmd BufRead *.phps set filetype=php
    autocmd BufRead *.phpd set filetype=php

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
    set mouse=a                             " Activate mouse

" Completion
    set wildmenu
    set wildmode=list:longest               " Complete files like a shell.

" Statusline
    set number                              " Show line numbers in gutter
    set ruler                               " Always show current position along the bottom
    set showcmd                             " Show the command being typed

    set laststatus=2

    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline=%<%f\                    " Filename
    set statusline+=%w%h%m%r                " Options
    set statusline+=\ [%{&ff}/%Y]           " Show filetype in statusline
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Editor
    set bs=indent,eol,start                 " Backspace works everywhere
    set ruler                               " Show current cursor position
    set history=1000                        " increase history size
    set visualbell                          " No beeping.
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

    " Hit space to see next page
    nmap <Space> <PageDown>

    "  Clean code function
    function! CleanCode()
        %retab          " Replace tabs with spaces
        %s/\r/\r/eg     " Turn DOS returns ^M into real returns
        %s=  *$==e      " Delete end of line blanks
        echo "Cleaned up this mess."
    endfunction
    nmap <silent> <F10> :call CleanCode()<CR>
    nmap <silent> <C-F10> :call CleanCode()<CR>

    " Alias for Sex
    nmap <F12> :Sex<CR>"

" NERDTree
    let g:NERDTreeWinPos = "right"
    nnoremap <F2> :NERDTreeToggle<CR>
    nnoremap <F3> :TlistToggle<CR>

" MiniBufXplorer settings
    let g:miniBufExplMaxSize=3              " set max size to 3 lines
    let g:miniBufExplMapWindowNavVim= 1     " Navigate trough buffers with Control + [hjkl]
    let g:miniBufExplMapWindowNavArrows=1   " Navigate trough buffers with Control + Arrow Keys
    let g:miniBufExplMapCTabSwitchBufs=1    " Navigate trough buffers with <C-TAB> and <C-S-TAB>
    let g:miniBufExplModSelTarget=1         " Hide others explorers out of MBE
    let g:miniBufExplSplitBelow=0           " Put new window above current or on the left for vertical split
    " Minibufexpl with ,q is better than :Bclose :)
    noremap <leader>q :Bclose<CR>

" TagList settings
    let Tlist_Auto_Open=0
    let Tlist_Use_Right_Window=0
    let Tlist_Sort_Type = "name"            " order by
    let tlist_php_settings = 'php;c:class;d:constant;f:function' " don't show variables in php

" use :W to force save when forgot to open file in root
    "command W w !sudo tee % > /dev/null
    cmap W silent write !sudo tee % >/dev/null
