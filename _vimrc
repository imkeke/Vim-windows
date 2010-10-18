" File: _vimrc
" Author: keke
" Description: keke's vimrc
" Last Modified: 七月 27, 2010

" 基本设定
"colo zenburn
"colo desert
"colo yytextmate
set history=400			"历史记录条数
set t_vb=				"关闭警告音
set nocompatible		"去掉兼容模式
set magic				"用于正则表达式
set ru					"标尺信息
set ai					"autoindent自动缩进
set sw=4				"设置tab宽度
set ts=4
set dy=lastline			"显示最多行，不用@@
set backspace=indent,eol,start	"缩进相关
sy on					"设置高亮
set go= 				"无菜单、工具栏
set nobackup			"无备份
set hlsearch			"高亮搜索
set showmatch			"设置匹配模式
set number 				"显示行号
set cursorline			"设置当前行高亮
set clipboard+=unnamed  "和系统剪贴板共享
:filetype plugin on

" 分割窗口切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 全屏插件
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Ctrl+s保存
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Win下设置字体
       au BufWinLeave *.ztx mkview
       au BufWinEnter *.ztx silent loadview
au BufNewFile,BufRead *.tx1 setf tx1
if has("win32")
	"set guifont=Monaco:h9:cANSI
	"set guifont=Bitstream Vera Sans Mono:h9:cANSI
    "set guifont=YaHei\ Mono:h9
	"set guifont=Inconsolata:h12:cANSI
    set guifont=Courier_New:h10:cANSI
    set guifontwide=YaHei\ Mono:h9
endif

" 设置窗口位置和大小
au GUIEnter * simalt ~x " 启动时最大化

" 解决中文乱码
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" 快速打开常用文件
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :source $MYVIMRC<CR>

" 标签快捷键
nmap <C-t>   :tabnew<CR>
nmap <C-Tab> :tabnext<CR>

" 打开关闭NERDtree
map <leader>n :NERDTreeToggle<CR>
map <leader>f :FufFile<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$','\~$']

" 建立日记的目录和快捷键设定
let g:calendar_diary="D:/keke/diary"
map <F2> :CalendarH<CR>

" 代码折叠
set foldmethod=marker

" 缩进
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" 让Command Mode也有Bash的Key Binding
cmap <c-a> <home>
cmap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{"path": "D:/My Dropbox/vimwiki/", "path_html": "D:/My Dropbox/vimwiki/html/", "html_header": "D:/My Dropbox/vimwiki/template/header.tpl", "html_footer": "D:/My Dropbox/vimwiki/template/footer.tpl", "auto_export": 1}]

" jQuery 语法高亮
au BufRead,BufNewFile *.js set syntax=jquery

" CSS3 语法支持
au BufRead,BufNewFile *.css set ft=css syntax=css3

" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行
set wildmenu "命令行补全以增强模式运行

" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf
" 自动改变当前目录
if has('netbeans_intg')
    set autochdir
endif

" 格式化CSS
" map <leader>.fcss :%s/;\([a-z\*\_]\)/;\r\1/g<cr>:%s/\(\w\){\([^\r]\)/\1\ {\r\2/g<cr>:%s/;}/;\r}/<cr>

" 去除结尾空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" 去掉结尾^M
nnoremap <leader>E :%s/$//g<cr>:let @/=''<CR>
" 折叠HTML标签
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" Wrap visual selection in an HTML tag.
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  let tag = input("Tag to wrap block: ")
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i</".tag.">"
    else
      exe "normal a</".tag.">"
    endif
    normal `<
    exe "normal i<".tag.">"
    normal `<
  endif
endfunction
