"=============================================================================
"      FileName: basic.vim
"   Description: 此为基本配置文件，只进行了一些基本设置，没有映射任何快捷方式
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"      HomePage: http://yysfire.github.io
"  Last Changed: 2018-05-09 17:54
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

"Show line number and relative line number
set nu
set rnu

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
" 显示Tab符，使用一高亮竖线代替，拖尾空白用'-'代替
set listchars=tab:\|\ ,trail:-

" Highlight column 100
if v:version >= 703
    "set cc=100
    set colorcolumn=+1
    hi ColorColumn ctermbg=Gray ctermfg=Black guibg=#404040
    command! Skinny set cc=73
    command! Narrow set cc=80
    command! Wide set cc=101
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

" 搜索时忽略大小写
set ignorecase
" 搜索时有大写字母时仍保持对大小写敏感
set smartcase
" 高亮搜索关键字
set hlsearch
"在输入要搜索的文字时，vim会实时匹配
set incsearch
" 搜索到文件两端时不重新搜索
set nowrapscan

" Don't redraw while executing macros (good performance config)
" 如果不置位此选项，自动更新文件修改时间的功能就会失效
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
" 插入括号时，短暂地跳转到匹配的对应括号。只有在屏幕上能看到匹配时才会进行跳转
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

" 在xterm和screen下支持256色
if !has('gui_running') && (&term =~ "xterm") || (&term =~ "screen")
  set t_Co=256
endif

"enable 16 colors in ConEmu
if !has('gui_running') && !empty($ConEmuBuild)
  "set term=xterm
  set t_Co=16
  "let &t_AB="\e[48;5;%dm"
  "let &t_AF="\e[38;5;%dm"
endif

"colors sonoma

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
    set gfn+=Bitstream_Vera_Sans_Mono:h10.5
    set gfn+=Consolas:h10
    set gfn+=Dejavu_Sans_Mono:h10

    set gfw+=楷体:h11
    set gfw+=YaHei_Consolas_Hybrid:h9
    set gfw+=Yahei_Mono:h9
    set gfw+=Microsoft_Yahei:h9
  endif
endif

if has("gui_running")
  set guioptions-=t "去掉可撕下的菜单项
  "set guioptions-=m "去掉菜单栏
  set guioptions-=T "去掉工具栏
  set guioptions-=L "有垂直分割的窗口时，去掉左边的滚动条
  set guioptions-=r "去掉右边的滚动条
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

if has("gui_running")
  language message zh_CN.utf-8
else
  language message C
endif

" 解决菜单乱码
if has("gui_running")
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  set langmenu=zh_CN.utf-8
endif

"Set UTF-8 as the default encoding for commit messages
"autocmd BufNewFile,BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8
autocmd BufNewFile,BufReadPost,BufWritePre,FileWritePre COMMIT_EDITMSG,git-rebase-todo setlocal fileencoding=utf-8

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

"设置备份文件的目录
let &backupdir=myBackupDir
"设置交换文件的目录
let &directory=myBackupDir
"备份文件的后缀由默认的~改为".bak"
set backupext=.bak
"给备份文件名加上时间戳，就可实现多版本控制
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.bak'
"在备份文件目录创建所编辑文件的原始备份
"set patchmode=.orig
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
set shiftwidth=4 "(自动) 缩进每一步使用的空白数目。用于 'cindent'、>>、<< 等。
set tabstop=8
set softtabstop=4 "执行编辑操作，如插入 <Tab> 或者使用 <BS> 时，把 <Tab> 算作4个空格

au FileType html,htmldjango,xml,sh,vim,php setlocal sw=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
" 如果打开，行首的 <Tab> 根据 'shiftwidth' 插入空白。'tabstop' 或
" 'softtabstop' 用在别的地方。<BS> 删除行首 'shiftwidth' 那么多的空白。
" 如果关闭，<Tab> 总是根据 'tabstop' 或 'softtabstop' 决定插入空白的数目
set smarttab

" Wrap long lines
set wrap
if has("linebreak")
  " 在单词的空白处折行
  "set lbr
  " 折行前面加上 <==> 标志
  set showbreak=<==>
endif
" 折行时使用行号栏, 与 showbreak 配合使用
set cpo+=n
"set tw=78
"set formatoptions+=mM
"au filetype txt,text setlocal formatoptions=aw2qmM
" 文本文件禁用自动断行
au filetype txt,text setlocal tw=0

set autoindent
"set smartindent
set cindent

"将C++作用域声明置于其所在代码块的0个字符后。(缺省为'shiftwidth')。作用域声明
"可以是"public:","protected:"或者"private:"
set cinoptions=g0,t0,(0,u0,w1,m1
"标准的 GNU 编码风格的设置
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=8
"默认值
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,g0,hs,ps,t0,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,M0,j0,)20,*30,#0


" 控制缓冲区切换的行为
try
  set switchbuf=useopen,usetab,newtab
  " 当多于一个标签时显示标签行
  set stal=1
catch
endtry

" 打开文件自动定位到上次光标所在位置
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" 退出Vim时保存所有缓存区信息，下次打开Vim可恢复
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
" 有条件地自动创建不存在的目录
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoMkdir
  autocmd!
  autocmd  BufNewFile  *  :call vimrcfunc#basic#EnsureDirExists()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 默认根据语法高亮进行折叠
set foldmethod=syntax
" 默认展开所有折叠
set foldlevel=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => :TOhtml 转换成HTML命令的相关设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不使用css
let g:html_use_css = 0
"中文支持
let g:html_use_encoding = "gb2312"
"强制去掉行号
let g:html_number_lines = 0
"强制编行号（根据要转换的内容重新编号）
"let g:html_number_lines = 1
"采用默认number 选项设置
"unlet g:html_number_lines
"忽略代码折叠
let g:html_ignore_folding = 1
"不使用xhtml
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
