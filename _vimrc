" Basics
    set nocompatible                        " Use defauts Vim
    syntax enable

" Pathogen install
    call pathogen#runtime_append_all_bundles()

" Encoding
    set ff=unix                             " Unix EOL
    set fileencoding=UTF-8                  " Speak UTF-8
    set encoding=UTF-8                      " Display UTF-8

" Color
    set background=dark                     " dark background is better!
"    colorscheme desertEx                    " change ColorScheme
    let php_sql_query = 1                   " SQL queries
    let php_htmlInStrings = 1               " HTML
    if has('gui_running')
        let g:solarized_style="light"
        let g:solarized_contrast="high"
        colorscheme solarized
    else
        colorscheme solarized
    endif

" UI
    set cursorline                          " Highlight the current line
    set scrolloff=8                         " Keep x line for scope while scrolling
    set sidescrolloff=8                     " same same
    set showmatch                           " Show matching bracket
    set number                              " Show line numbers in gutter
    set ruler                               " Always show current position along the bottom
    set showcmd                             " Show the command being typed


" Editor
    set bs=indent,eol,start                 " Backspace works everywhere
    set ruler                               " Show current cursor position
    set history=50                          " command history size
    set noerrorbells                        " Stop the noise!!
    set listchars=trail:¤,tab:>-            " Show blank spaces and tabs at the end of a line


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
    " Minibufexpl with bclose ,q is better than :Bclose :)
    noremap <leader>q :Bclose<CR>
    noremap <leader>q! :Bclose!<CR>


" NERDTree
    let g:NERDTreeWinPos = "right"


" MiniBufXplorer settings
    let g:miniBufExplMaxSize=2              " set max size to 2 lines
    let g:miniBufExplMapWindowNavVim= 1     " Navigate trough buffers with Control + [hjkl]
    let g:miniBufExplMapWindowNavArrows=1   " Navigate trough buffers with Control + Arrow Keys
    let g:miniBufExplMapCTabSwitchBufs=1    " Navigate trough buffers with <C-TAB> and <C-S-TAB>
    let g:miniBufExplModSelTarget=1         " Hide others explorers out of MBE
    let g:miniBufExplSplitBelow=0           " Put new window above current or on the left for vertical split


" Initialization
"    autocmd VimEnter * NERDTree             " Automatically open NERDTree when start...
"    autocmd VimEnter * wincmd p             " ...but come back in the main window
