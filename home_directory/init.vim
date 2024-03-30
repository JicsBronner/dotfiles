"
" Memo :
" -  " : registers
" -  yi( : copy inside ()
" -  c
" -  Ctrl + f : pagedown
" -  Ctrl + b : pageup
" -  Ctrl + d : fzf tag
" -  , + g : git
" -  , + " : terminal
" -  , + t : jump to tagbar
" - use s operator for surround : "titi toto" -› ds"  -› titi toto
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
set t_Co=256
set conceallevel=0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
set undofile
set undodir=~/.vim/undo

"------------------------------------------------------------
" Annoying shits
"------------------------------------------------------------
set colorcolumn=120
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
autocmd BufRead,BufNewFile *config setfiletype sh
autocmd BufRead,BufNewFile *.cpp let g:lsp_diagnostics_enabled=0
autocmd BufRead,BufNewFile *.json let g:lsp_diagnostics_enabled=0
autocmd BufWritePre * %s/\s\+$//e
nnoremap <CR> :noh<CR><CR>
nmap <silent>./ :noghsearch<CR>

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------
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
map <Leader>z <C-w>=
map <Leader>a <C-w>\|

"-----------------------------------------------------------
" Plugin
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'overcache/NeoSolarized'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'junegunn/fzf', { 'tags' : '0.28.0' }
Plug 'zackhsi/fzf-tags'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/junegunn/vim-peekaboo.git'
Plug 'https://github.com/yegappan/mru.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
call plug#end()

"-----------------------------------------------------------
" Color
set termguicolors
colorscheme catppuccin_latte
"colorscheme quantum
"colorscheme NeoSolarized
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
"let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
"let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
"let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
"let g:neosolarized_bold = 1
"let g:neosolarized_underline = 1
"let g:neosolarized_italic = 0

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
"let g:neosolarized_termBoldAsBright = 1
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

"-----------------------------------------------------------
" Indentation options
"-----------------------------------------------------------
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4
let g:indentLine_enabled = 1

"-----------------------------------------------------------
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

nnoremap <Leader>" :call FloatTerm()<CR>
nnoremap <Leader>p :call FloatTerm('"python"')<CR>
imap <C-@> <C-Space>

"-----------------------------------------------------------
" Fuzzy
"-----------------------------------------------------------
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
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

let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

map <Leader>ff <ESC>:Files<CR>
map <Leader>fs <ESC>:FZF<CR>
map <Leader>fp <ESC>:FZF ../<CR>
map <Leader>fh <ESC>:FZF ~<CR>
map <Leader><Enter> <ESC>:Buffers<CR>

"------------------------------------------------------------
" FZF tags
"nmap <C-d> <Plug>(fzf_tags)
noreabbrev <expr> ts getcmdtype() == ":" && getcmdline() == 'ts' ? 'FZFTselect' : 'ts'
let g:fzf_tags_prompt = "Gd "

"------------------------------------------------------------
" Git GUTTER
" map <Leader>g <ESC>:GitGutterPreviewHunk<CR>

"------------------------------------------------------------
" Lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

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
" Tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_compact = 1
nmap <F3> :TagbarToggle<CR>
nmap <Leader>t :TagbarOpen j<CR>

"-----------------------------------------------------------
" vim-LSP
nnoremap <leader>dd :LspDefinition<cr>
nnoremap <leader>dn :LspNextDiagnostic<cr>
nnoremap <leader>dp :LspPreviousDiagnostic<cr>
nnoremap <leader>df :LspReferences<cr>
nnoremap <leader>dr :LspRename<cr>
nnoremap <leader>ds :LspStopServer<cr>
nnoremap <leader>dp :LspPeekDefinition<cr>
nnoremap <leader>da :LspCodeAction<cr>
nnoremap <leader>dh :LspHover<cr>
""nnoremap <leader>df :LspDocumentFormat<cr>
