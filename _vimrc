""""""""""""""""""""""基本设置""""""""""""""""""""""
"colo desert			"颜色
"colo zenburn
colo yytextmate		"颜色
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

""""""""""""""""""""""默认目录""""""""""""""""""""""
set autochdir
" let g:Source="D:/source/"
" cd C:\

""""""""""""""""""""""全屏插件""""""""""""""""""""""
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
 
""""""""""""""""""""""Ctrl+s保存""""""""""""""""""""
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

""""""""""""""""""""""Win下设置字体"""""""""""""""""
       au BufWinLeave *.ztx mkview
       au BufWinEnter *.ztx silent loadview
au BufNewFile,BufRead *.tx1 setf tx1
if has("win32")
	"set guifont=Monaco:h9:cANSI
	"set guifont=Inconsolata:h13:cANSI
	"set guifont=YaHei\ Mono:h11
    set guifont=Courier_New:h12:cANSI
    set guifontwide=YaHei\ Mono:h10
endif

""""""""""""""""""""""设置窗口位置和大小""""""""""""
" winpos 250 220
" set lines=35 columns=150
au GUIEnter * simalt ~x " 启动时最大化

""""""""""""""""""""""解决中文乱码""""""""""""""""""
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

""""""""""""""""""""括号自动补全"""""""""""""""""
	":inoremap ( ()<ESC>i
	":inoremap ) <c-r>=ClosePair(')')<CR>
	":inoremap { {}<ESC>i
	":inoremap } <c-r>=ClosePair('}')<CR>
	":inoremap [ []<ESC>i
	":inoremap ] <c-r>=ClosePair(']')<CR>
	":inoremap < <><ESC>i
	":inoremap > <c-r>=ClosePair('>')<CR>
	"function ClosePair(char)
	"if getline('.')[col('.') - 1] == a:char
	"	return "\<Right>"
	"else
	"	return a:char
	"endif
	"endf

""""""""""""""""""""快速打开常用文件"""""""""""""""""
:map tnrc :tabedit D:\Program Files\Vim\_vimrc<CR>
:map  <F5> :tabprevious<CR>
:map  <F6> :tabnext<CR>
:imap  <F5> <ESC>:tabprevious<CR>
:imap  <F6> <ESC>:tabnext<CR>
:map tc :tabnew <cr>
:map tw :tabclose<cr>

""""""""""""""""""""设置当前行高亮"""""""""""""""""
"highlight CurrentLine guibg=#e8e8ff guifg=#000000  "(or whatever colors you want)
"au! Cursorhold * exe 'match CurrentLine /\%' . line('.') . 'l.*/'
"set ut=1
set cursorline

""""""""""""""""""""和系统剪贴板共享"""""""""""""""""
set clipboard+=unnamed

""""""""""""""""""""打开关闭NERDtree""""""""""""""""
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$','\~$']

""""""""""""""""""""建立日记的目录和快捷键设定""""""""""""""
let g:calendar_diary="D:/keke/diary"
map <F2> :CalendarH<CR>

""""""""""""""""""""代码折叠""""""""""""""
map ,f :set foldmethod=indent<CR>zM<CR>
map ,F :set foldmethod=manual<CR>zR<CR>

""""""""""""""""""""缩进""""""""""""""
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv 

""""""""""""""""""""让Command Mode也有Bash的Key Binding""""""""""""""
cmap <c-a> <home>
cmap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>

:filetype plugin on
"let g:NeoComplCache_EnableAtStartup = 1

let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{"path": "D:/My Dropbox/vimwiki/", "path_html": "D:/My Dropbox/vimwiki/html/", "html_header": "D:/My Dropbox/vimwiki/template/header.tpl", "html_footer": "D:/My Dropbox/vimwiki/template/footer.tpl", "auto_export": 1}]
