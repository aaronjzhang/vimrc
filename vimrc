set autoindent
set tabstop=4
set softtabstop=4
set cindent
set shiftwidth=4
set expandtab
set listchars=tab:>-,trail:-
set list
set enc=utf-8
set nu
"set fenc=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
syntax on

"set 80 colum line

set hlsearch

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

"set rtp+=~/.vim/bundle/vundle
"call vundle#rc()


"可以通过4种方式指定插件来源
"a)
"指定GitHub中vim-scripts仓库中的插件,直接指定插件名称即可,插件名中的空格使用"-"代替.
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/refactor'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/xml.vim'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/json.vim'
Plug 'vim-scripts/pyflakes'
Plug 'vim-scripts/Snipmate'
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/javacomplete'
Plug 'vim-scripts/OmniCppComplete'
Plug 'molok/vim-smartusline'
Plug 'vim-scripts/cscope.vim'
Plug 'nathanalderson/yang.vim'
Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
filetype plugin indent on

if filereadable("./.path") 
	source ./.path 
endif

"}}}

"设置80字符提示线
autocmd FileType c,cpp set colorcolumn=81

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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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

if has("autocmd")
  augroup redhat
	  autocmd!
	  " In text files, always limit the width of text to 78 characters
	  " autocmd BufRead *.txt set tw=78
	  " When editing a file, always jump to the last cursor position
	  autocmd BufReadPost *
				  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
				  \   exe "normal! g'\"" |
				  \ endif
	  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
	  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
	  "     " start with spec file template
	  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END 
endif

set tags=./tags;,tags
" Vim global plugin for autoloading cscope databases.
" Last Change: Wed Jan 26 10:28:52 Jerusalem Standard Time 2011
" Maintainer: Michael Conrad Tadpol Tilsra <tadpol@tadpol.org>
" Revision: 0.5

if exists("loaded_autoload_cscope")
	finish
endif
let loaded_autoload_cscope = 1

" requirements, you must have these enabled or this is useless.
if(  !has('cscope') || !has('modify_fname') )
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" If you set this to anything other than 1, the menu and macros will not be
" loaded.  Useful if you have your own that you like.  Or don't want my stuff
" clashing with any macros you've made.
if !exists("g:autocscope_menus")
  let g:autocscope_menus = 1
endif

"==
" windowdir
"  Gets the directory for the file in the current window
"  Or the current working dir if there isn't one for the window.
"  Use tr to allow that other OS paths, too
function s:windowdir()
  if winbufnr(0) == -1
    let unislash = getcwd()
  else 
    let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
  endif
    return tr(unislash, '\', '/')
endfunc
"
"==
" Find_in_parent
" find the file argument and returns the path to it.
" Starting with the current working dir, it walks up the parent folders
" until it finds the file, or it hits the stop dir.
" If it doesn't find it, it returns "Nothing"
function s:Find_in_parent(fln,flsrt,flstp)
  let here = a:flsrt
  while ( strlen( here) > 0 )
    if filereadable( here . "/" . a:fln )
      return here
    endif
    let fr = match(here, "/[^/]*$")
    if fr == -1
      break
    endif
    let here = strpart(here, 0, fr)
    if here == a:flstp
      break
    endif
  endwhile
  return "Nothing"
endfunc
"
"==
" Cycle_macros_menus
"  if there are cscope connections, activate that stuff.
"  Else toss it out.
"  TODO Maybe I should move this into a seperate plugin?
let s:menus_loaded = 0
function s:Cycle_macros_menus()
  if g:autocscope_menus != 1
    return
  endif
  if cscope_connection()
    if s:menus_loaded == 1
      return
    endif
    let s:menus_loaded = 1
    set csto=0
    set cst
    silent! map <unique> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
    silent! map <unique> <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
    if has("menu")
      nmenu &Cscope.Find.Symbol<Tab><c-\\>s
        \ :cs find s <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Definition<Tab><c-\\>g
        \ :cs find g <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Called<Tab><c-\\>d
        \ :cs find d <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Calling<Tab><c-\\>c
        \ :cs find c <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Assignment<Tab><c-\\>t
        \ :cs find t <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Egrep<Tab><c-\\>e
        \ :cs find e <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.File<Tab><c-\\>f
        \ :cs find f <C-R>=expand("<cword>")<CR><CR>
      nmenu &Cscope.Find.Including<Tab><c-\\>i
        \ :cs find i <C-R>=expand("<cword>")<CR><CR>
"      nmenu &Cscope.Add :cs add 
"      nmenu &Cscope.Remove  :cs kill 
      nmenu &Cscope.Reset :cs reset<cr>
      nmenu &Cscope.Show :cs show<cr>
      " Need to figure out how to do the add/remove. May end up writing
      " some container functions.  Or tossing them out, since this is supposed
      " to all be automatic.
    endif
  else
    let s:menus_loaded = 0
    set nocst
    silent! unmap <C-\>s
    silent! unmap <C-\>g
    silent! unmap <C-\>d
    silent! unmap <C-\>c
    silent! unmap <C-\>t
    silent! unmap <C-\>e
    silent! unmap <C-\>f
    silent! unmap <C-\>i
    if has("menu")  " would rather see if the menu exists, then remove...
      silent! nunmenu Cscope
    endif
  endif
endfunc
"
"==
" Unload_csdb
"  drop cscope connections.
function s:Unload_csdb()
  if exists("b:csdbpath")
    if cscope_connection(3, "out", b:csdbpath)
      let save_csvb = &csverb
      set nocsverb
      exe "cs kill " . b:csdbpath
      set csverb
      let &csverb = save_csvb
    endif
  endif
endfunc
"
"==
" Cycle_csdb
"  cycle the loaded cscope db.
function s:Cycle_csdb()
    if exists("b:csdbpath")
      if cscope_connection(3, "out", b:csdbpath)
        return
        "it is already loaded. don't try to reload it.
      endif
    endif
    let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),$HOME)
"    echo "Found cscope.out at: " . newcsdbpath
"    echo "Windowdir: " . s:windowdir()
    if newcsdbpath != "Nothing"
      let b:csdbpath = newcsdbpath
      if !cscope_connection(3, "out", b:csdbpath)
        let save_csvb = &csverb
        set nocsverb
        exe "cs add " . b:csdbpath . "/cscope.out " . b:csdbpath
        set csverb
        let &csverb = save_csvb
      endif
      "
    else " No cscope database, undo things. (someone rm-ed it or somesuch)
      call s:Unload_csdb()
    endif
endfunc

" auto toggle the menu
augroup autoload_cscope
 au!
 au BufEnter *.[chly]  call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
 au BufEnter *.cc      call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
 au BufUnload *.[chly] call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()
 au BufUnload *.cc     call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()
augroup END

let &cpo = s:save_cpo

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
