" First Vundle must be set up because other bundles need this
" Vundle
" https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'bruno-/vim-alt-mappings'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'Raimondi/delimitMate'

Plugin 'kien/ctrlp.vim'
   nmap <c-p><c-p> :CtrlP <cr>
   nmap <c-p><c-o> :CtrlPCurWD <cr>
Plugin 'tomtom/tcomment_vim'
Plugin 'fsouza/go.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'mtth/scratch.vim'
Plugin 'greplace.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mcandre/Conque-Shell'
Plugin 'The-NERD-Commenter'
Plugin 'matchit.zip'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-easymotion'
    let g:EasyMotion_leader_key = '<Leader><Leader>'
    " usage: <Leader><Leader>fx
    " usage: <Leader><Leader>w
Plugin 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
     vmap <Enter> <Plug>(EasyAlign)
    " " Start interactive EasyAlign for a motion/text object (e.g. gaip)
     nmap ga <Plug>(EasyAlign)
    " usage: select & <Enter>
Plugin 'terryma/vim-multiple-cursors'
    let g:multi_cursor_use_default_mapping = 1
    " let g:multi_cursor_next_key='<C-n>'
    " let g:multi_cursor_prev_key='<C-p>'
    " let g:multi_cursor_skip_key='<C-x>'
    " let g:multi_cursor_quit_key='<Esc>'
    " usage: select & <C-n>
" Plugin 'SirVer/ultisnips'
    " let g:UltiSnipsExpandTrigger="<tab>"
    " let g:UltiSnipsJumpForwardTrigger="<tab>"
    " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " "let g:UltiSnipsSnippetDirectories  = ["snips"]
    " function! g:UltiSnips_Complete()
        " call UltiSnips#ExpandSnippet()
        " if g:ulti_expand_res == 0
            " if pumvisible()
                " return "\<C-n>"
            " else
                " call UltiSnips#JumpForwards()
                " if g:ulti_jump_forwards_res == 0
                   " return "\<TAB>"
                " endif
            " endif
        " endif
        " return ""
    " endfunction
    " au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Plugin 'honza/vim-snippets'

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
set guifont=Courier\ 10\ Pitch\ 13,Monospace\ 12,Consolas\ 12
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

set background=light
colorscheme desert

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
vmap <C-c> "+y

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

" For Matlab
" 设置matlab语言的ctags
autocmd FileType matlab map <F8> :!Ctags --langdef=matlab --langmap=matlab.m --regex-matlab="/^function[ \t]*\\[.*\\][ \t]*=[ \t]*([a-zA-Z0-9_]+)/\1/f,function/" --regex-matlab="/^function[ \t]*[a-zA-Z0-9_]+[ \t]*=[ \t]*([a-zA-Z0-9_]+)/\1/f,function/" --regex-matlab="/^function[ \t]*([a-zA-Z0-9_]+)[^=]*$/\1/f,function/" --regex-matlab="/^.*\s*function\s*(\w+)\s*=\s*(\w+)\s*\(.*$/\2/f,function/" --regex-matlab="/^.*\s*function\s*(\w+)\s*\(.*$/\1/f,function/" --languages=matlab --extra=+q --excmd=pattern -R .<CR>:call EditTagFile()<CR>
" 编辑Tag文件
function EditTagFile()
    exe ':e tags'
    for lineNum in range(line('^'), line('$'))
        " 得到每一行的内容
        let lineStr = getline(lineNum)
        if matchstr(lineStr, '^!') == ""
            let fileName = matchstr(lineStr, '\v\\\zs((\w|_)*)\ze(\.m)')
            let tagName = matchstr(lineStr, '\v^\zs(\S*)\ze(\t)')
            if fileName != tagName
                let newLineStr = fileName.'.'.lineStr
                call setline(lineNum, newLineStr)
            endif
        else
            if matchstr(lineStr, '^!_TAG_FILE_SORTED') != ""
                let startStr = matchstr(lineStr,'\v\zs(^)\S*\ze(\t)')
                let endStr = matchstr(lineStr, '\v\d\t\zs(.*)\ze($)')
                let newLineStr = startStr."\t"."0"."\t".endStr
                call setline(lineNum, newLineStr)
            endif
        endif
    endfor
    exe ':w'
    exe ':bdelete tags'
endfunction
autocmd FileType matlab map <C-]> :call MyFindTag() <CR>zRz.
" 搜索tag
function MyFindTag()
    let tagFullName = expand("<cWORD>")
    if matchstr(tagFullName, '\v\(') != ""
        let tagFullName = matchstr(tagFullName, '\v(\w|_|\.)*\ze(\()')
    end
    let tagName = expand("<cword>")
    if tagName == tagFullName
        " 是否已在函数定义位置
        let lineStrTemp = getline('.')
        if matchstr(lineStrTemp, '\v^\s*\zs(function)\ze(\s)') != ""
            return
        else
            exe ':ta '.tagName
        endif
    else
        let objName = matchstr(tagFullName, '\v\zs(.*)\ze(\.)')
        let funcName = matchstr(tagFullName, '\v\.\zs(\w+)')
        " 类中定义的子函数
        if objName == "obj"
            for lineNumTemp in range(line('^'), line('$'))
                let lineStrTemp = getline(lineNumTemp)
                if matchstr(lineStrTemp, '\v^\s*\zs(classdef)\ze(\s)') != ""
                    let className = matchstr(lineStrTemp, '\v^\s*classdef\s*\zs((\w|_)*)')
                    " exe ':tag '.tagName
                    break
                endif
            endfor
        else
            " 得到类的定义函数
            let endLineNum = line('.')
            while 1
                let isFindName = 0
                exe ':echo '.isFindName
                for lineNum in range(line('^'), endLineNum - 1)
                    " 得到每一行的内容
                    let lineStr = getline(lineNum)
                    if matchstr(lineStr, '\v^\s*\zs('.objName.')\s*\=') != ""
                        if matchstr(lineStr, '\v^\s*\zs('.objName.')\s*\=\s*'.objName.'\.') == ""
                            " 得到类名字
                            let objName = matchstr(lineStr, '\v\=\s*\zs((\w|_)*)\ze(\(|;)')
                            let endLineNum = lineNum
                            let isFindName = 1
                            break
                        end
                    endif
                endfor
                if isFindName == 0 || endLineNum <= 0
                    let className = objName
                    break
                endif
            endwhile
        endif
        " 得到要搜索的tag的名字
        let tagName = className.'.'.funcName
        exe ':tag '.tagName
    endif
endfunction
