" Basics
    set nocompatible                        " Use defauts Vim
    filetype off                            " deactivate filetype for pathogen to load snipmate correctly

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Plugin 'gmarik/vundle'

    Plugin 'scrooloose/nerdtree'
    Plugin 'msanders/snipmate.vim'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-scripts/taglist.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'docteurklein/vim-symfony'
    Plugin 'docteurklein/php-getter-setter.vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'godlygeek/tabular'
    Plugin 'tpope/vim-surround'
    Plugin 'mileszs/ack.vim'
    Plugin 'austintaylor/vim-commaobject'
    Plugin 'vim-scripts/matchit.zip'
    Plugin 'tpope/vim-markdown'
    Plugin 'kien/ctrlp.vim'
    Plugin 'dougireton/vim-chef'
    Plugin 'vim-php/vim-php-refactoring'
    Plugin 'arnaud-lb/vim-php-namespace'
    Plugin 'fatih/vim-go'

    filetype plugin indent on               " reactivate filetype

" filetype
    autocmd BufRead *.twig set filetype=htmltwig
    autocmd BufRead *.less set filetype=less
    autocmd BufRead *.pde set filetype=pde
    autocmd BufRead *.hbs set filetype=html
    autocmd BufRead *.mvel set filetype=java
    autocmd BufRead *.yml set filetype=yaml
    autocmd BufRead *.json set filetype=json
    autocmd BufRead .php_cs set filetype=php

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
    set undolevels=1000                     " increase history size
    set visualbell                          " No beeping.
    set noerrorbells                        " No beeping.
    set nobackup                            " No backup file!
    set noswapfile                          " No more swap file!
    set tags+=./tags.vendors,tags.vendors

" Search
    " set incsearch                           " Highlight matches as you type.
    set hlsearch                            " Highlight matches.
    " set ignorecase                          " Case-insensitive searching.
    " set smartcase                           " But case-sensitive if expression contains a capital letter.

" Indentation
    set autoindent                          " Automatic indentation
    set shiftround                          " when at 3 spaces, and I hit > ... go to 4, not 7

" Keymap
    " Changing leader
    let mapleader   = ","
    let g:mapleader = ","

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " Switch to paste mode to copy a large alount of text
    set pastetoggle=<F4>

    " Hit space to see next page
    nmap <Space> <PageDown>

    " Navigate trough split
    nmap <silent> <C-Up> :wincmd k<CR>
    nmap <silent> <C-Down> :wincmd j<CR>
    nmap <silent> <C-Left> :wincmd h<CR>
    nmap <silent> <C-Right> :wincmd l<CR>

    "  Clean code function
    function! CleanCode()
        silent! %retab                                  " Replace tabs with spaces
        silent! %s/\r//eg                             " Turn DOS returns ^M into real returns
        silent! %s=  *$==e                              " Delete end of line blanks
        echo "Cleaned up this mess."
    endfunction
    nmap <silent> <F10> :call CleanCode()<CR>

" Undo
    set undodir=~/.vim/backups
    set undofile

" Ack
    " do a Ack search on the word under cursor
    nmap <leader>f :Ack <C-r><C-w><CR>
    " do a Ack search on the selected text
    vmap <leader>f y:Ack <C-r>"<CR>

" NERDTree
    let g:NERDTreeWinPos = "right"
    nnoremap <F2> :NERDTreeToggle<CR>
    nnoremap <F3> :TlistToggle<CR>
    nnoremap <leader>o :NERDTreeFind<CR>

" MiniBufXplorer settings
    let g:miniBufExplMaxSize=3              " set max size to 3 lines
    let g:miniBufExplMapWindowNavVim= 1     " Navigate trough buffers with Control + [hjkl]
    let g:miniBufExplMapWindowNavArrows=1   " Navigate trough buffers with Control + Arrow Keys
    let g:miniBufExplMapCTabSwitchBufs=1    " Navigate trough buffers with <C-TAB> and <C-S-TAB>
    let g:miniBufExplModSelTarget=1         " Hide others explorers out of MBE
    let g:miniBufExplSplitBelow=0           " Put new window above current or on the left for vertical split
    " Minibufexpl with ,q is better than :Bclose :)
    noremap <leader>q :Bclose<CR>
    " Add mapping to navigate
    noremap <C-Down>  <C-W>j
    noremap <C-Up>    <C-W>k
    noremap <C-Left>  <C-W>h
    noremap <C-Right> <C-W>l
    noremap <C-TAB>   :MBEbn<CR>
    noremap <C-S-TAB> :MBEbp<CR>

" Tabular mapping
    nmap <Leader>a= :Tab /=<CR>
    vmap <Leader>a= :Tab /=<CR>
    nmap <Leader>a=> :Tab /=><CR>
    vmap <Leader>a=> :Tab /=><CR>
    nmap <Leader>a: :Tab /:\zs<CR>
    vmap <Leader>a: :Tab /:\zs<CR>

" CtrlP
    set wildignore+=*/app/cache/**
    set wildignore+=*/var/cache/**
    set wildignore+=*/\.subsplit/**
    set wildignore+=*/node_modules/**
    set wildignore+=*/\.sass-cache/**
    set wildignore+=*/\.grunt/**
    let g:ctrlp_map = '<leader>t'
    "let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_max_files = 0
    let g:ctrlp_max_depth = 100

" Syntastic
    let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Highlight column 80 + column 120 & after
    execute "set colorcolumn=80," . join(range(120,335), ',')

" use :W to force save when forgot to open file in root
    cmap w!! w !sudo tee % > /dev/null

" PHP Getter / Setter template. Don't work if put into vim/ftplugin
    let b:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"

    let b:phpgetset_setterTemplate =
    \ "    \n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"
