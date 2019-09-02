function! myspacevim#before() abort
    let g:mapleader = ","
    nnoremap <C-j> <C-]> 
    set timeoutlen=300
    let g:airline_powerline_fonts = 1
endfunction
