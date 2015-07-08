" First Vundle must be set up because other bundles need this
" Vundle
" https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'bruno-/vim-alt-mappings'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'benjaminwhite/Benokai'
Plugin 'fsouza/go.vim'
Plugin 'wting/rust.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mtth/scratch.vim'
Plugin 'greplace.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mcandre/Conque-Shell'
Plugin 'The-NERD-Commenter'
Plugin 'matchit.zip'

call vundle#end()

"
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"                                End Vundle                               "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Store as ~/.vimrc (Unix) or ~/_vimrc (Windows)
" Fix Delete (backspace) on Mac OS X
set backspace=2

" Enable syntax highlighting
syntax on

" Indentation
set autoindent
filetype plugin indent on

" Use OS clipboard for copypasta
set clipboard=unnamed

set fileencodings=utf-8,cp936,latin1,ucs-bom
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set backspace=indent,eol,start
set guifont=Monospace\ 12,Consolas\ 12
" Show line numbers
set number
" Show column numbers
set ruler
" Case-insensitive search
set ignorecase
" Highlight search results
set hlsearch
"match parenthesis
set showmatch
" Default to soft tabs, 2 spaces
set expandtab
set sw=2
set sts=2


" Enable OS mouse clicking and scrolling
"
" Note for Mac OS X: Requires SIMBL and MouseTerm
"
" http://www.culater.net/software/SIMBL/SIMBL.php
" https://bitheap.org/mouseterm/
if has("mouse")
   set mouse=a
endif

" Bash-style tab completion
set wildmode=longest,list
set wildmenu

" No swap files, use version control instead
set noswapfile

" Emacs-style start of line / end of line navigation
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-e> $
vnoremap <silent> <C-a> ^
vnoremap <silent> <C-e> $
inoremap <silent> <C-a> <esc>^i
inoremap <silent> <C-e> <esc>$i

" Fix Alt key in MacVIM GUI
" TODO - Fix in MacVIM terminal
if has("gui_macvim")
  set macmeta
endif

" Emacs-style start of file / end of file navigation
nnoremap <silent> <M-<> gg
nnoremap <silent> <M->> G$
vnoremap <silent> <M-<> gg
vnoremap <silent> <M->> G$
inoremap <silent> <M-<> <esc>ggi
inoremap <silent> <M->> <esc>G$i

" Do not attempt to fix style on paste
" Normally we would just `set paste`, but this interferes with other aliases.
nnoremap <silent> p "+p

" Except for Makefiles: Hard tabs of width 2
autocmd FileType make set ts=2
" And Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4
au BufRead,BufNewFile *.md set filetype=markdown
" And Java
autocmd FileType java set sw=2

" Default to Unix LF line endings
set ffs=unix

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20

let g:vim_markdown_folding_disabled=1 " Markdown
let javaScript_fold=1                 " JavaScript
let perl_fold=1                       " Perl
let php_folding=1                     " PHP
let r_syntax_folding=1                " R
let ruby_fold=1                       " Ruby
let sh_fold_enabled=1                 " sh
let vimsyn_folding='af'               " Vim script
let xml_syntax_folding=1              " XML

"
" Wrap window-move-cursor
"
function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction

nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
nnoremap <silent> <C-w><Left> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w><Down> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w><Up> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w><Right> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

" Column 80 marker
highlight OverLength ctermbg=red ctermfg=white guibg=#660000
match OverLength /\%81v.\+/

" " Currently broken due to Vim/Semicolon issues
" " Alt+; to toggle comments
" nnoremap <silent> <M-;> gc
" vnoremap <silent> <M-;> gc
" inoremap <silent> <M-;> <esc>gci
"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看    

" Scratch splits the current window in half
let g:scratch_height = 0.50
" Scratch opens in Markdown format
let g:scratch_filetype = 'markdown'

" Conque Allow C-w window navigation while in insert mode
let g:ConqueTerm_CWInsert = 1

" Replace shell with Conque-Shell
set nocp
cabbrev sh sh<C-\>esubstitute(getcmdline(), '^sh', 'ConqueTerm bash', '')<cr>
