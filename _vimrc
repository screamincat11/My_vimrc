set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" ***********************************
" Many of these lines come from Steve Losh http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
" ***********************************
" makes vim vim, not vi
set nocompatible 
" having fun
" echo ">^.^<" 
" added to for security concerns
set modelines=0
" these four settings keep normal mode indents and insertion tabs consistent.  Additionally, expandtab uses spaces instead of the tab character
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" From stackoverflow; show allow auto HTML indenting
filetype plugin indent on

" ************** line numbering ****************
" makes line numbering relative.  
set relativenumber
" gives absolute line number for current line
set number
" sets ammount of space for line numbers
set numberwidth=4
" **********************************************
set undofile
let mapleader = "\\"
let maplocalleader = "\\"
" nnoremap \ ,
" vnoremap \ ,\
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" **************** line wrapping *****************
set wrap
set linebreak
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=80
" ************************************************
" these two commands allow you to see tabs and new lines; they mess up text wrapping
" set list
" set listchars=tab:?\ ,eol:¬
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" nnoremap ; :
au FocusLost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
inoremap jk <ESC>
inoremap <esc> <nop>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
colorscheme torte
nnoremap <leader>p "+gP
" *********  These are added by Learning Vim the hard way
" Edit's vimrc file 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Applies vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>- ddp
noremap <leader>_ ddkP
inoremap <c-u> <esc>viwU<esc>i
nnoremap <c-u> viwU<esc>
iabbrev @@ RyanSullivanAK@gmail.com
iabbrev ITcom IlluminatingTexts.com
iabbrev ssig --<cr>Ryan Sullivan<cr>RyanSullivanAK@gmail.com
iabbrev teh the
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>l
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>l
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
" This commanded doesn't work and I don't know why
"nnoremap <leader>c I<!--<esc>A--><esc>
"autocmd FileType html setlocal norelativenumber
"autocmd FileType python setlocal norelativenumber
augroup programming
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType javascript,java :iabbrev <buffer> rtn return
    autocmd FileType javascript,java :iabbrev <buffer> return NOPENOPENOPE
augroup END
" vnoremap <leader>" iw'><esc>a"<esc>hviw'<<esc>i"<esc>viw
augroup filetype_html
    autocmd!
    autocmd FileType html,php nnoremap <buffer> <localleader>f VATZF
    autocmd FileType html,php nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
    autocmd FileType html,php nnoremap <buffer> <localleader>tli I<li><esc>A</li><esc>
    autocmd FileType html,php nnoremap <buffer> <localleader>tp I<p><esc>A</p><esc>
    autocmd FileType html,php :iabbrev <buffer> rqt &rdquo;
    autocmd FileType html,php :iabbrev <buffer> &rdquo; NOPENOPENOPE
    autocmd FileType html,php :iabbrev <buffer> lqt &ldquo;
    autocmd FileType html,php :iabbrev <buffer> &ldquo; NOPENOPENOPE
    "autocmd BufWritePre,BufRead *.html :normal gg=G
    "autocmd BufWritePre,BufRead *.html setlocal nowrap
augroup END
"augroup markdown
    "autocmd!
    "autocmd BufRead *.md :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch
"augroup END
augroup lesson16
    autocmd!
    autocmd BufRead *.md onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
"    autocmd BufRead *.md onoremap <buffer> aH :<c-u>execute "normal! ?\\v^[\\=\\=+]|[\\-\\-+]$\r:nohlsearch\rg_vk0"<cr>
    "autocmd BufRead *.md onoremap <buffer> ah :<c-u>execute "normal! ?\v^(==+|--+)$\r:nohlsearch\rg_vk0"<cr>
    "autocmd BufRead *.md onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rkvg_"<cr>
augroup END

