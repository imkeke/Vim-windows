""""""""""""""""""""""��������""""""""""""""""""""""
"colo desert			"��ɫ
"colo zenburn
colo yytextmate		"��ɫ
set history=400			"��ʷ��¼����
set t_vb=				"�رվ�����
set nocompatible		"ȥ������ģʽ 
set magic				"����������ʽ
set ru					"�����Ϣ
set ai					"autoindent�Զ�����
set sw=4				"����tab���
set ts=4
set dy=lastline			"��ʾ����У�����@@
set backspace=indent,eol,start	"�������
sy on					"���ø���
set go= 				"�޲˵���������
set nobackup			"�ޱ���
set hlsearch			"��������
set showmatch			"����ƥ��ģʽ
set number 				"��ʾ�к�

""""""""""""""""""""""Ĭ��Ŀ¼""""""""""""""""""""""
set autochdir
" let g:Source="D:/source/"
" cd C:\

""""""""""""""""""""""ȫ�����""""""""""""""""""""""
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
 
""""""""""""""""""""""Ctrl+s����""""""""""""""""""""
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

""""""""""""""""""""""Win����������"""""""""""""""""
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

""""""""""""""""""""""���ô���λ�úʹ�С""""""""""""
" winpos 250 220
" set lines=35 columns=150
au GUIEnter * simalt ~x " ����ʱ���

""""""""""""""""""""""�����������""""""""""""""""""
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

""""""""""""""""""""�����Զ���ȫ"""""""""""""""""
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

""""""""""""""""""""���ٴ򿪳����ļ�"""""""""""""""""
:map tnrc :tabedit D:\Program Files\Vim\_vimrc<CR>
:map  <F5> :tabprevious<CR>
:map  <F6> :tabnext<CR>
:imap  <F5> <ESC>:tabprevious<CR>
:imap  <F6> <ESC>:tabnext<CR>
:map tc :tabnew <cr>
:map tw :tabclose<cr>

""""""""""""""""""""���õ�ǰ�и���"""""""""""""""""
"highlight CurrentLine guibg=#e8e8ff guifg=#000000  "(or whatever colors you want)
"au! Cursorhold * exe 'match CurrentLine /\%' . line('.') . 'l.*/'
"set ut=1
set cursorline

""""""""""""""""""""��ϵͳ�����干��"""""""""""""""""
set clipboard+=unnamed

""""""""""""""""""""�򿪹ر�NERDtree""""""""""""""""
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$','\~$']

""""""""""""""""""""�����ռǵ�Ŀ¼�Ϳ�ݼ��趨""""""""""""""
let g:calendar_diary="D:/keke/diary"
map <F2> :CalendarH<CR>

""""""""""""""""""""�����۵�""""""""""""""
map ,f :set foldmethod=indent<CR>zM<CR>
map ,F :set foldmethod=manual<CR>zR<CR>

""""""""""""""""""""����""""""""""""""
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv 

""""""""""""""""""""��Command ModeҲ��Bash��Key Binding""""""""""""""
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
