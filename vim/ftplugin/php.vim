" PDV
    let g:pdv_cfg_Author = "Olivier Dolbeau <contact@odolbeau.fr>"
    nnoremap <leader>d :call PhpDocSingle()<CR>
    vnoremap <leader>d :call PhpDocRange()<CR>

" php-getter-setter (avoid conflict with command-t)
    map <unique> <buffer> <leader>gs <Plug>PhpgetsetInsertBothGetterSetter
    map <unique> <buffer> <leader>g <Plug>PhpgetsetInsertGetterOnly
    map <unique> <buffer> <leader>s <Plug>PhpgetsetInsertSetterOnly
