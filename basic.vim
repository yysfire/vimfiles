"=============================================================================
"      FileName: basic.vim
"   Description: ��Ϊ���������ļ���ֻ������һЩ�������ã�û��ӳ���κο�ݷ�ʽ
"        Author: �Ĺ����( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 4.5
"  Last Changed: 2014-07-04 00:17
"=============================================================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> GUI and Colors
"    -> Encoding, Fileformats
"    -> Files and backups
"    -> Turn persistent undo on
"    -> Text, tab and indent related
"    -> Status line
"    -> :TOhtml related
"    -> Folding related
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (g:ostype=='windows')
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

set nocompatible

" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"Show line number
set nu

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
"set hid

set list
" ��ʾTab����ʹ��һ�������ߴ��棬��β�հ���'-'����
set listchars=tab:\|\ ,trail:-

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

" ����ʱ���Դ�Сд
set ignorecase
" ����ʱ�д�д��ĸʱ�Ա��ֶԴ�Сд����
set smartcase
" ���������ؼ���
set hlsearch
"������Ҫ����������ʱ��vim��ʵʱƥ��
set incsearch
" �������ļ�����ʱ����������
set nowrapscan

" Don't redraw while executing macros (good performance config)
" �������λ��ѡ��Զ������ļ��޸�ʱ��Ĺ��ܾͻ�ʧЧ
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
" ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ���š�ֻ������Ļ���ܿ���ƥ��ʱ�Ż������ת
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Fonts and Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" ��xterm��screen��֧��256ɫ
"if (&term =~ "xterm") || (&term =~ "screen")
"set t_Co=256
"endif

"enable 256 colors in ConEmu on Win
"if !has('gui_running') && !empty($ConEmuBuild)
"set term=xterm
"set t_Co=256
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"
"endif

colors sonoma

" Set font according to system
if has("gui_running")
  if g:ostype=='unix'
    set gfn+=Monaco\ 10
    set gfn+=monofur\ 13.5
    set gfn+=Inconsolata\ 12
    set gfn+=Dejavu\ Sans\ Mono\ 10.5
    set gfn+=Bitstream\ Vera\ Sans\ Mono\ 12
    set gfn+=Monospace\ 14

    set gfw+=WenQuanYi\ Zen\ Hei\ 12
    set gfw+=Microsoft\ Yahei\ 12
  else
    set gfn+=Monaco:h10
    set gfn+=monofur:h13.5
    set gfn+=Inconsolata:h12
    set gfn+=Dejavu_Sans_Mono:h10.5
    set gfn+=Bitstream_Vera_Sans_Mono:h10.5
    set gfn+=Consolas:h13

    set gfw+=Microsoft_Yahei:h11.5
    set gfw+=Yahei_Mono:h11
    set gfw+=YaHei_Consolas_Hybrid:h11.5
  endif
endif

if has("gui_running")
  set guioptions-=t "ȥ����˺�µĲ˵���
  "set guioptions-=m "ȥ���˵���
  set guioptions-=T "ȥ��������
  set guioptions-=L "�д�ֱ�ָ�Ĵ���ʱ��ȥ����ߵĹ�����
  set guioptions-=r "ȥ���ұߵĹ�����
  if has("windows")
    set guitablabel=%M\ %t
  endif
endif

if has("gui_running")
  "set lines=40
  "set columns=120
  let &helpheight = &lines/2
  " Maximum window when GUI running
  if g:ostype=='windows'
    au GUIEnter * simalt ~x
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding, Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if (g:ostype=='windows'||has("win32unix"))
  set termencoding=cp936
else
  set termencoding=utf-8
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
  set ambiwidth=double
endif

" Set helplang
set helplang=cn

if !has("gui_running")
  language message en_US.utf-8
else
  language message zh_CN.utf-8
endif

" ����˵�����
if has("gui_running")
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  set langmenu=zh_CN.utf-8
endif


"Favorite fileformats
if g:ostype=='windows'
  set ffs=dos,unix,mac
elseif g:ostype=='unix'
  set ffs=unix,dos,mac
elseif g:ostype=='mac'
  set ffs=mac,unix,dos
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowb
set noswapfile

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif

let myBackupDir = expand( $HOME . "/.vim_temp_dir" )
if !isdirectory(myBackupDir)
  call mkdir(myBackupDir, "p")
endif

"���ñ����ļ���Ŀ¼
let &backupdir=myBackupDir
"���ý����ļ���Ŀ¼
let &directory=myBackupDir
"�����ļ��ĺ�׺��Ĭ�ϵ�~��Ϊ".bak"
set backupext=.bak
"�������ļ�������ʱ������Ϳ�ʵ�ֶ�汾����
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.bak'
"�ڱ����ļ�Ŀ¼�������༭�ļ���ԭʼ����
set patchmode=.orig
set backupskip+=.gitignore,.hgignore


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
  let myUndoDir = expand(myBackupDir . "/undo")
  if !isdirectory(myUndoDir)
    call mkdir(myUndoDir, "p")
  endif
  let &undodir = myUndoDir
  set undofile
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 4 spaces
set shiftwidth=4 "(�Զ�) ����ÿһ��ʹ�õĿհ���Ŀ������ 'cindent'��>>��<< �ȡ�
set tabstop=8
set softtabstop=4 "ִ�б༭����������� <Tab> ����ʹ�� <BS> ʱ���� <Tab> ����4���ո�

au FileType html,xml,sh,vim,php setlocal sw=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
" ����򿪣����׵� <Tab> ���� 'shiftwidth' ����հס�'tabstop' ��
" 'softtabstop' ���ڱ�ĵط���<BS> ɾ������ 'shiftwidth' ��ô��Ŀհס�
" ����رգ�<Tab> ���Ǹ��� 'tabstop' �� 'softtabstop' ��������հ׵���Ŀ
set smarttab

" Linebreak on 100 characters
"if has("linebreak")
"set lbr
"endif
"set tw=78
"set formatoptions+=mM
"au filetype txt,text setlocal formatoptions=aw2qmM
" �ı��ļ������Զ�����
au filetype txt,text setlocal tw=0

set autoindent
"set smartindent
set cindent

"��C++�������������������ڴ�����0���ַ���(ȱʡΪ'shiftwidth')������������
"������"public:","protected:"����"private:"
set cinoptions=g0,t0,(0,u0,w1,m1
"��׼�� GNU �����������
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=8
"Ĭ��ֵ
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,g0,hs,ps,t0,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,M0,j0,)20,*30,#0


" ���ƻ������л�����Ϊ
try
  set switchbuf=useopen,usetab,newtab
  " ������һ����ǩʱ��ʾ��ǩ��
  set stal=1
catch
endtry

" ���ļ��Զ���λ���ϴι������λ��
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" �˳�Vimʱ�������л�������Ϣ���´δ�Vim�ɻָ�
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=
set statusline+=%{HasPaste()}
set statusline+=\ %F%m%r%h\ %w%=
"set statusline+=\ CWD:%r%{getcwd()}%h
set statusline+=\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}]%y\ 
set statusline+=\ %l/%L=%p%%,%c\ 
set statusline+=\ %b,0x%B


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���������Զ����������ڵ�Ŀ¼
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoMkdir
  autocmd!
  autocmd  BufNewFile  *  :call vimrcfunc#basic#EnsureDirExists()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ĭ�ϸ����﷨���������۵�
set foldmethod=syntax
" Ĭ��չ�������۵�
set foldlevel=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => :TOhtml ת����HTML������������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��ʹ��css
let g:html_use_css = 0
"����֧��
let g:html_use_encoding = "gb2312"
"ǿ��ȥ���к�
let g:html_number_lines = 0
"ǿ�Ʊ��кţ�����Ҫת�����������±�ţ�
"let g:html_number_lines = 1
"����Ĭ��number ѡ������
"unlet g:html_number_lines
"���Դ����۵�
let g:html_ignore_folding = 1
"��ʹ��xhtml
let g:use_xhtml = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'Paste'
  en
  return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
