" Encoding {
    set ff=unix                             " Unix EOL
    set fileencoding=UTF-8                  " Speak UTF-8
    set encoding=UTF-8                      " Display UTF-8
" }

" UI {
    colorscheme wombat                      " change ColorScheme
    set cursorline                          " Highlight the current line
    set scrolloff=8                         " Keep x line for scope while scrolling
    set sidescrolloff=8                     " same same
    set showmatch                           " Show matching bracket
    set number                              " Show line numbers in gutter
    set ruler                               " Always show current position along the bottom
    set showcmd                             " Show the command being typed
" }

" Ediotr {
    set bs=indent,eol,start                 " Backspace works everywhere
    set ruler                               " Affichage des coordonees du curseur
    set history=50                          " Taille de l'historique des commandes
" }

" Indentation {
    set autoindent                          " Indentation automatique
    set tabstop=4                           " Nombre de caracteres pour tabulation
    set shiftwidth=4
    set expandtab
" }

" Coloration syntaxique {
    if has("syntax")
        syntax on
    endif
    let php_sql_query = 1                   " Coloration des requetes SQL
    let php_htmlInStrings = 1               " Coloration des balises HTML
" }

" NERDTree {
    let g:NERDTreeWinPos = "right"
" }
