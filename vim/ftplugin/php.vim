" Indentation
    set softtabstop=4  " tab = 4 space
    set shiftwidth=4
    set expandtab      " no more tabs, only spaces!

" Editor
    set list
    set listchars=trail:¤,tab:>-,nbsp:•     " Show blank spaces and tabs at the end of a line

" php-getter-setter (avoid conflict with command-t)
    map <buffer> <leader>gs <Plug>PhpgetsetInsertBothGetterSetter
    map <buffer> <leader>g <Plug>PhpgetsetInsertGetterOnly
    map <buffer> <leader>s <Plug>PhpgetsetInsertSetterOnly
    let g:phpgetset_getterTemplate =
        \ "\n" .
        \ "    public function %funcname%()\n" .
        \ "    {\n" .
        \ "        return $this->%varname%;\n" .
        \ "    }"

" PHP namespaces
    inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>

" Use CtrlP to go to a given tag
    map <silent> <leader>gt :CtrlPTag<cr><c-\>w

" Others
    let php_sql_query = 1                   " SQL queries
    let php_htmlInStrings = 1               " HTML
