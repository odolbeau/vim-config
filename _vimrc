scriptencoding utf-8

" Backspace works everywhere
set bs=2
" Affichage des coordonees du curseur
set ruler

" #### INDENTATION
set autoindent " Indentation automatique
set tabstop=4 " Nombre de caracteres pour tabulation
set shiftwidth=4
set expandtab

" Coloration syntaxique
if has("syntax")
    syntax on
endif
" Coloration des requetes SQL
let php_sql_query = 1
" Coloration des balises HTML
let php_htmlInStrings = 1 

" Taille de l'historique des commandes
set history=50
