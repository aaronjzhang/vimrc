set autoindent
set tabstop=4
set softtabstop=4
set cindent
set shiftwidth=4
set enc=utf-8
set nu
"set fenc=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
syntax on

"设置nerdtree
let NERDTreeDirArrows = 0 
let NERDTreeSortOrder = ['\/$', '\.(h|cpp|c)$', '\.swp$', '\.bak$', '\~$']
let NERDTreeIgnore = ['\~$', '\.o$', '\.vim$', '\.in$']
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"设置Ctrl+]
map <F12> <C-]>

"设置Taglist {{{
let Tlist_Show_One_File = 1	"不同时显示多个文件的tag,只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist是最后一个窗口,则退出
let Tlist_Use_Right_Window = 1 "Taglist窗口显示在右边
map <F9> :Tlist<CR>

"}}}

"设置F7执行make
map <F7> :make<CR>

"change window's size
map w= :resize+3<CR>
map w- :resize-3<CR>
map w, :vertical resize+3<CR>
map w. :vertical resize-3<CR>

"set syntastic
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
"set statusline +=%#warningmsg#
"set statusline +=%{SyntasticStatuslineFlag()}
"set statusline +=%*
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let g:smartusline_string_to_highlight = '(%n) %f '
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'
set laststatus=2

let g:syntastic_always_populate_loc_list=1
let g:syntastic_atuo_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"vundle设置 {{{
set nocompatible  "be iMproved
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

"可以通过4种方式指定插件来源
"a)
"指定GitHub中vim-scripts仓库中的插件,直接指定插件名称即可,插件名中的空格使用"-"代替.
Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'xml.vim'
Bundle 'FuzzyFinder'
Bundle 'json.vim'
Bundle 'pyflakes'
Bundle 'Snipmate'
Bundle 'AutoComplPop'
Bundle 'javacomplete'
Bundle 'OmniCppComplete'
Bundle 'molok/vim-smartusline'
Bundle 'vim-scripts/cscope.vim'
Bundle 'nathanalderson/yang.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

if filereadable("./.path") 
	source ./.path 
endif

"}}}

"设置javacomplete
"if &filetype == 'java'
"setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#ParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-SPACE> <C-X><C-U><C-P>
"endif
"
let mapleader=","
let g:mapleader=","
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

"设置 YouCompleteMe
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
""\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile withsyntastic
nnoremap <leader>lo :lopen<CR>	"open locationlist
nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>gd :YcmCompleter GoToDefinition<CR> "跳转到定义处
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR> "跳转到定义处

