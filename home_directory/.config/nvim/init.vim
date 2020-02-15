set nocompatible
filetype indent plugin on
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set encoding=UTF-8
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set cursorline
set laststatus=2
set visualbell
set mouse=a
filetype plugin on
set cmdheight=1
set number relativenumber
set pastetoggle=<F11>
highlight EndOfBuffer ctermfg=black ctermbg=black
set background=dark
set t_Co=256
set conceallevel=0

"-----------------------------------------------------------
" Indentation options
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4

"------------------------------------------------------------
" Mappings
let mapleader=','
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"------------------------------------------------------------
" Annoying shits
set colorcolumn=100
set splitbelow splitright
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.dsv setfiletype lua
autocmd BufRead,BufNewFile *.map setfiletype lua
autocmd BufRead,BufNewFile *.rule setfiletype lua
autocmd BufRead,BufNewFile *.json setfiletype sh
autocmd BufWritePre * %s/\s\+$//e
nnoremap <CR> :noh<CR><CR>

"-----------------------------------------------------------
" Plugin
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/itchyny/vim-gitbranch.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/sbdchd/neoformat.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/Yggdroot/indentLine'

call plug#end()

"-----------------------------------------------------------
" Nerdtree
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

"-----------------------------------------------------------
" Tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 20
let g:tagbar_compact = 1

"-----------------------------------------------------------
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_cpp_check_header = 0
let g:syntastic_mode_map = {
            \ "mode": "passive",
    \ "active_filetypes": ["python", "cpp", "c", "bash", "lua"],
    \ "passive_filetypes": [] }

map <F4> <ESC>:call SyntasticToggle()<CR>

let g:syntastic_is_open = 0
function! SyntasticToggle()
    if g:syntastic_is_open == 1
        lclose
        let g:syntastic_is_open = 0
    else
        Errors
        let g:syntastic_is_open = 1
    endif
endfunction

"-----------------------------------------------------------
" Fuzzy
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

" buffer FZF
function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Ag fzf
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* G call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

map <Leader>ff <ESC>:FZF<CR>
map <Leader>fp <ESC>:FZF ../<CR>
map <Leader>fh <ESC>:FZF ~<CR>

"------------------------------------------------------------
" Lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"------------------------------------------------------------
" deoplete + neoformat
let g:pyhton3_host_prog='/usr/bin/python3.7'
let g:deoplete#enable_at_startup = 1
let g:neoformat_enabled_cpp = ['clang-format']
let g:neoformat_enabled_c = ['clang-format']
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_python = ['autopep8']

"------------------------------------------------------------
" LSP
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd-7'],
  \ 'c': ['clangd-7'],
  \ 'lua': ['lua-lsp'],
  \ 'python': ['~/.local/bin/pyls'],
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 1
"let g:LanguageClient_diagnosticsList = "Location"

nnoremap <silent> <C-d> :call LanguageClient_textDocument_definition()      <CR>
nnoremap <silent> <C-u> :call LanguageClient_textDocument_hover()           <CR>
nnoremap <silent> <C-c> :call LanguageClient#textDocument_rename()          <CR>
nnoremap <silent> <C-p> :call LanguageClient#textDocument_documentSymbol()  <CR>
nnoremap <silent> <C-f> :call LanguageClient#textDocument_codeAction()      <CR>

"-------------------------------------------------------------
" OmniCppCompletion plugin
"-------------------------------------------------------------
" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" auto complete after '::'
let OmniCpp_MayCompleteScope = 1
" don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0

"-----------------------------------------------------------
" Color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=light
colorscheme quantum

"-----------------------------------------------------------
" Shortcuts

"cpp
autocmd FileType cpp inoremap ,if if()<Enter>{<Enter>}<Esc>2k2la
autocmd FileType cpp inoremap ,else else<Enter>{<Enter><Enter>}<Esc>ki<Tab>
autocmd FileType cpp inoremap ,fo for(const auto & )<Enter>{<Enter>}<Esc>2k$i
autocmd FileType cpp inoremap ,main int main(int argc, char *argv[])<Enter>{<Enter><Enter>return 0;<Enter>}<Esc>2ki<Tab>
autocmd FileType cpp inoremap ,ndef #ifndef _<Enter>#define _<Enter>#endif<Esc>2k$<C-v>j<S-a>
autocmd FileType cpp inoremap ,vs std::vector<std::string>;<Esc>i
autocmd FileType cpp inoremap ,vi std::vector<int>;<Esc>i
autocmd FileType cpp inoremap ,ms std::map<std::string, >;<Esc>hi
autocmd FileType cpp inoremap ,mi std::map<int, >;<Esc>hi
autocmd FileType cpp inoremap ,cout std::cout << << "\n";<Esc>T<2hi
autocmd FileType cpp inoremap ,class class {<Enter>public:<Enter>private:<Enter>};<Esc>3k$i
autocmd FileType cpp inoremap ,log Log::instance() << Log::Level:: <Enter><<<Enter><< Log::endl;<Esc>2k$i

"c
autocmd FileType c inoremap ,if if()<Enter>{<Enter>}<Esc>2k2la
autocmd FileType c inoremap ,fo for()<Enter>{<Enter>}<Esc>2k2la
autocmd FileType c inoremap ,main int main(int argc, char *argv[])<Enter>{<Enter><Enter>return 0;<Enter>}<Esc>2ki<Tab>
autocmd FileType c inoremap ,ndef #ifndef _<Enter>#define _<Enter>#endif<Esc>2k$<C-v>j<S-a>
autocmd FileType c inoremap ,else else<Enter>{<Enter><Enter>}<Esc>ki<Tab>

"python
autocmd FileType python inoremap ,if if :<Esc>ha
autocmd FileType python inoremap ,fo for :<Esc>hi
autocmd FileType python inoremap ,cmd self.assert_device_cmd("")<Esc>hi

"lua
autocmd FileType lua inoremap ,if if then<Enter>end<Esc>ki
autocmd FileType lua inoremap ,fo for do<Enter>end<Esc>ka

"sh
autocmd FileType sh inoremap ,if if [  ]<Enter>then<Enter>fi<Esc>2k3la
autocmd FileType sh inoremap ,fo for i in {0..}<Enter>do<Enter>done<Esc>2k$i

"-----------------------------------------------------------
"Cscope mapping
if has('cscope')

    function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
            let path = strpart(db, 0, match(db, "/cscope.out$"))
            set nocscopeverbose " suppress 'duplicate connection' error
            exe "cs add " . db . " " . path
            set cscopeverbose
            " else add the database pointed to by environment variable
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endfunction
    au BufEnter /* call LoadCscope()

  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

"  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
  """"""""""""" Standard cscope/vim boilerplate

  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  "set cscopetag

  " check cscope for definition of a symbol before checking ctags: set to 1
  " if you want the reverse search order.
  set csto=0
  " show msg when any other cscope db added
  set cscopeverbose
  " The following maps all invoke one of the following cscope search types:
  "
  "   's'   symbol: find all references to the token under cursor
  "   'g'   global: find global definition(s) of the token under cursor
  "   'c'   calls:  find all calls to the function name under cursor
  "   't'   text:   find all instances of the text under cursor
  "   'e'   egrep:  egrep search for the word under cursor
  "   'f'   file:   open the filename under cursor
  "   'i'   includes: find files that include the filename under cursor
  "   'd'   called: find functions that function under cursor calls
  "
  nmap <C-f>s :tab scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-f>g :tab scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-f>c :tab scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-f>t :tab scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-f>e :tab scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-f>f :tab scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-f>i :tab scs find i <C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-f>d :tab scs find d <C-R>=expand("<cword>")<CR><CR>


endif
cnoreabbrev <expr> csa
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
    cnoreabbrev <expr> csf
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
    cnoreabbrev <expr> csk
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
    cnoreabbrev <expr> csr
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
    cnoreabbrev <expr> css
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
    cnoreabbrev <expr> csh
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')

