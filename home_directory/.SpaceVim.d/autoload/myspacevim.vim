function! myspacevim#before() abort
  let g:spacevim_lint_on_save = 0
  let g:mapleader = ","
  nnoremap <C-j> <C-]> 
  set timeoutlen=300
  cmap w!! w !sudo tee > /dev/null %
  let g:spacevim_filemanager = 'nerdtree'
  set pastetoggle=<F4>

    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
  
  nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
  nnoremap <leader>l :call cscope#toggleLocationList()<CR>

  ""  s: Find this C symbol
  nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
  " g: Find this definition
  nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
  " d: Find functions called by this function
  nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
  " c: Find functions calling this function
  nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
  " t: Find this text string
  nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
  " e: Find this egrep pattern
  nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
  " f: Find this file
  nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
  " i: Find files #including this file
  nnoremap <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
endfunction

function! myspacevim#after() abort
  set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
endfunction
