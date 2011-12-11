" PDV
let g:pdv_cfg_Author = "Olivier Dolbeau <contact@odolbeau.fr>"
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>

" php-getter-setter (avoid conflict with command-t)
map <buffer> <leader>gs <Plug>PhpgetsetInsertBothGetterSetter
map <buffer> <leader>g <Plug>PhpgetsetInsertGetterOnly
map <buffer> <leader>s <Plug>PhpgetsetInsertSetterOnly

set path+=**

" jump to a twig view in symfony
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>
