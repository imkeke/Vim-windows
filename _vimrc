" File: _vimrc
" Author: keke
" Description: keke's vimrc
" Last Modified: ���� 27, 2010

" �����趨
"colo zenburn
"colo desert
"colo yytextmate
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
set cursorline			"���õ�ǰ�и���
set clipboard+=unnamed  "��ϵͳ�����干��
:filetype plugin on

" �ָ���л�
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ȫ�����
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Ctrl+s����
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Win����������
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

" ���ô���λ�úʹ�С
au GUIEnter * simalt ~x " ����ʱ���

" �����������
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

" ���ٴ򿪳����ļ�
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>s :source $MYVIMRC<CR>

" ��ǩ��ݼ�
nmap <C-t>   :tabnew<CR>
nmap <C-Tab> :tabnext<CR>

" �򿪹ر�NERDtree
map <leader>n :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$','\~$']

" �����ռǵ�Ŀ¼�Ϳ�ݼ��趨
let g:calendar_diary="D:/keke/diary"
map <F2> :CalendarH<CR>

" �����۵�
set foldmethod=marker

" ����
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" ��Command ModeҲ��Bash��Key Binding
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

" jQuery �﷨����
au BufRead,BufNewFile *.js set syntax=jquery

" CSS3 �﷨֧��
au BufRead,BufNewFile *.css set ft=css syntax=css3

" ��������״̬��
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " ʼ����ʾ״̬��
set wildmenu "�����в�ȫ����ǿģʽ����

" ��ȡ��ǰĿ¼
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf
" �Զ��ı䵱ǰĿ¼
if has('netbeans_intg')
    set autochdir
endif

" ��ʽ��CSS
" map <leader>.fcss :%s/;\([a-z\*\_]\)/;\r\1/g<cr>:%s/\(\w\){\([^\r]\)/\1\ {\r\2/g<cr>:%s/;}/;\r}/<cr>

" ȥ����β�ո�
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ȥ����β^M
nnoremap <leader>E :%s/$//g<cr>:let @/=''<CR>
" �۵�HTML��ǩ
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
