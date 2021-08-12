" Basics
    set nocompatible " Required by vundle
    filetype off " Required by vundle
    set rtp+=~/.vim/bundle/Vundle.vim " Update runtime path
    call vundle#begin()

    " Let bundle manage itself
    Plugin 'VundleVim/Vundle.vim'

    " Plugins
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'bling/vim-bufferline'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-syntastic/syntastic'
    Bundle 'lumiliet/vim-twig'
    Plugin 'tpope/vim-surround'
    Plugin 'geoffharcourt/vim-matchit'
    Plugin 'tpope/vim-markdown'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'tpope/vim-abolish.git'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'drmikehenry/vim-fontsize'

    " Color schemes
    Plugin 'altercation/vim-colors-solarized'

    cal vundle#end()
    filetype plugin indent on " Automatically detect file types. Required when using vundle

    " Enable mouse
    set mouse=a
    set ttymouse=xterm2

    " Colors
    syntax enable " Syntax highlighting
    "let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_termcolors=256
    colorscheme solarized
    set background=light

    " Instead of reverting the cursor to the last position in the buffer, we set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    set cursorline " Highlight the current line

    set ruler " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids

    set backspace=indent,eol,start " Backspace for dummies
    set linespace=0 " No extra spaces between rows
    set number " Line numbers on
    set showmatch " Show matching brackets/parenthesis
    set hlsearch " Highlight search terms
    set winminheight=0 " Windows can be 0 line high
    set wildmenu " Show list instead of just completing
    set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
    set list
    set listchars=tab:›-,trail:¤,nbsp:• " Highlight problematic whitespace
    set scrolloff=9999 " Minimum lines to keep above and below cursor (stay in the middle with this config
    set nospell " No spell check
    set autoread " Auto reload a file change outside vim

" Formatting
    set nowrap " Do not wrap long lines
    set autoindent " Indent at the same level of the previous line
    set shiftwidth=4 " Use indents of 4 spaces
    set expandtab " Tabs are spaces, not tabs
    set tabstop=4 " An indentation every four columns
    set softtabstop=4 " Let backspace delete indent
    set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
    set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
    set nofoldenable " disable folding

" filetype
    autocmd BufRead *.yml set filetype=yaml
    autocmd BufRead *.json set filetype=json
    autocmd BufRead .php_cs set filetype=php
    autocmd BufRead .md set filetype=markdown

" Encoding
    set ff=unix " Unix EOL
    set fileencoding=UTF-8 " Speak UTF-8
    set encoding=UTF-8 " Display UTF-8

" Editor
    set bs=indent,eol,start " Backspace works everywhere
    "set ruler " Show current cursor position
    set history=1000 " increase history size
    set novisualbell " No blinking.
    set noerrorbells " No beeping.
    set nobackup " Remove backups
    set noswapfile " No more swap file!
    set tags+=./tags.vendors,tags.vendors
    set hid " Change buffer without saving
    set ttyfast " Smoother changes when drawing terminal

" Indentation
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 7

" Keymap
    " Changing leader
    let mapleader   = ","
    let g:mapleader = ","

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    autocmd! bufwritepost vimrc source ~/.vimrc
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " Navigate trough split
    nmap <silent> <C-Up> :wincmd k<CR>
    nmap <silent> <C-Down> :wincmd j<CR>
    nmap <silent> <C-Left> :wincmd h<CR>
    nmap <silent> <C-Right> :wincmd l<CR>

    " Navigate trough buffers
    nmap <silent> <S-Left> :bprevious<CR>
    nmap <silent> <S-Right> :bnext<CR>

    " Close buffers
    noremap <leader>q :Bclose<CR>

    " Clean code function
    function! CleanCode()
        silent! %retab " Replace tabs with spaces
        silent! %s/\r//eg " Turn DOS returns ^M into real returns
        silent! %s=  *$==e " Delete end of line blanks
        echo "Cleaned up this mess."
    endfunction
    nmap <silent> <F10> :call CleanCode()<CR>

" Undo
    set undodir=~/.vim/cache/backups
    set undofile
    set undolevels=1000 " increase history size

" Ack
    " do a Ack search on the word under cursor
    nmap <leader>f :Ack <C-r><C-w><CR>
    " do a Ack search on the selected text
    vmap <leader>f y:Ack <C-r>"<CR>

" NERDTree
    let NERDTreeWinPos = "right"
    let NERDTreeWinSize = 45
    let NERDTreeCascadeSingleChildDir = 0
    let NERDTreeAutoDeleteBuffer=1
    nnoremap <F2> :NERDTreeToggle<CR>
    nnoremap <leader>o :NERDTreeFind<CR>

" CtrlP
    set wildignore+=*/app/cache/**
    set wildignore+=*/var/cache/**
    set wildignore+=*/\.subsplit/**
    set wildignore+=*/node_modules/**
    set wildignore+=*/\.sass-cache/**
    set wildignore+=*/\.grunt/**
    let g:ctrlp_map = '<leader>p'
    "let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_match_window = 'bottom,min:1,max:40,results:40'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_max_files = 0
    let g:ctrlp_max_depth = 200
    let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|NERD'
    let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit = 0

" Highlight column 80 + column 120 & after
    set colorcolumn=80,120

" use :W to force save when forgot to open file in root
    cmap w!! w !sudo tee % > /dev/null

" vim-airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='solarized'
    let g:airline_left_sep='›' " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
    let g:airline_section_c = '%{getcwd()}/%t'

" vim-bufferline
    noremap <C-S-Tab> :bprevious<CR>
    noremap <C-Tab> :bnext<CR>

" neocomplete
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Ultisnip
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"

" jsx
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic
    let g:syntastic_javascript_checkers = ['eslint']
