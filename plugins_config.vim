"=============================================================================
"      FileName: plugins_config.vim
"   Description: 插件的相关配置，请确保至少已加载 basic.vim
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"      HomePage: http://yysfire.github.io
"  Last Changed: 2017-03-01 13:18
"=============================================================================

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIMFILES/bundle/Vundle.vim
let bundlepath = '$VIMFILES/bundle/'
call vundle#begin(bundlepath)
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Fuzzy file, buffer, mru, tag, etc finder.
"Plugin 'kien/ctrlp.vim'
"Quickly locate files, buffers, mrus, ... in large project.
Plugin 'Yggdroot/LeaderF'
"Displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'
"Alternate Files quickly (.c --> .h etc)
Plugin 'a.vim'
"A fancy start screen for Vim.
Plugin 'mhinz/vim-startify'

" Code Completion Section
if has("python") || has("python3")
  "The ultimate snippet solution for Vim.
  Plugin 'SirVer/ultisnips'
endif
"vim-snipmate default snippets (Previously snipmate-snippets)
Plugin 'honza/vim-snippets'
"Provides support for expanding abbreviations similar to emmet.
Plugin 'mattn/emmet-vim'
"Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

"Surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

Plugin 'matchit.zip'

Plugin 'scrooloose/nerdcommenter'

"Syntax checking hacks
Plugin 'scrooloose/syntastic'

"Code Compile and Run
Plugin 'xuhdev/SingleCompile'

" Syntax/Indent Section
"Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plugin 'plasticboy/vim-markdown'
"Vastly improved Javascript indentation and syntax support
Plugin 'pangloss/vim-javascript'
"HTML5 + inline SVG omnicomplete funtion, indent and syntax
Plugin 'othree/html5.vim'
"No-BS Python code folding
Plugin 'tmhedberg/SimpylFold'
"Configuration for Rust
Plugin 'rust-lang/rust.vim'

"Browse plain text easily(show the title tag and syntax highlight)
"Plugin 'yysfire/TxtBrowser'
"let txtbrowserfullpath = expand("$vimfiles/txtbrowser-yysfire")
"if (g:ostype=='windows' && !has("win32unix"))
    "let txtbrowserfullpath = substitute(txtbrowserfullpath, ':', '', "")
    "let txtbrowserfullpath = substitute(txtbrowserfullpath, '\\', '\/', "g")
"endif
"Plugin 'file:///' . txtbrowserfullpath

" Other Utils
Plugin 'tpope/vim-repeat'
Plugin 'vimwiki/vimwiki'
Plugin 'Rykka/riv.vim'
"Text filtering and alignment
Plugin 'Tabular'

"Sneak is a minimalist, versatile Vim motion plugin that
"jumps to any location specified by two characters.
Plugin 'justinmk/vim-sneak'

"Plugin 'Rykka/colorv.vim'

" Git Section
"A Git wrapper so awesome
Plugin 'tpope/vim-fugitive'
"A vimscript for creating gists,curl is required
Plugin 'mattn/gist-vim'
"Required by gist-vim
Plugin 'mattn/webapi-vim'

" Colorscheme Section
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'junegunn/seoul256.vim'

if has("python") || has("python3")
  "Graph your Vim undo tree in style.
  Plugin 'sjl/gundo.vim'
  "Lean & mean status/tabline for vim that's light as air.
  Plugin 'bling/vim-airline'
  "Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
  Plugin 'klen/python-mode'
endif

if g:ostype=='unix' && !has("win32unix")
    "Plugin 'fcitx.vim'
    Plugin 'SudoEdit.vim'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Local plugins
set rtp+=$VIMFILES/TxtBrowser/
"set rtp+=$VIMFILES/vimcdoc/
"set rtp+=$VIMFILES/vimwiki2markdown/
set rtp+=$VIMFILES/localbundle/*/



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode = 1
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_options_max_line_length = 100
let g:pymode_breakpoint_bind = '<leader>br'
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { "mode": "active",
      \ "active_filetypes": [],
      \ "passive_filetypes": ["python"] }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SingleCompile plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call SingleCompile#SetCompilerTemplate('c', 'gcc', 'GNU C Compiler',
             \'gcc', '-fno-tree-ch -O2 -Wall -std=c99 -pipe -lm -o $(FILE_TITLE)$',
             \'$(FILE_RUN)$')
call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler',
             \'g++', '-fno-tree-ch -O2 -Wall -std=c++11 -pipe -lm -o $(FILE_TITLE)$',
             \'$(FILE_RUN)$')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimwiki2markdown plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki2markdown_markdown_type = 'pelican'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType mkd,markdown,javascript,scala,textile,zsh,puppet,htmldjango,htmltornado,django,jinja2,ocaml let b:delimitMate_autoclose = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width = 30
"let g:tagbar_sort = 0

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Content'
	\ ],
        \ 'sort' : 0
\ }

let g:tagbar_type_vhdl = {
    \ 'ctagstype': 'vhdl',
    \ 'kinds' : [
        \'d:prototypes',
        \'b:package bodies',
        \'e:entities',
        \'a:architectures',
        \'t:types',
        \'p:processes',
        \'f:functions',
        \'r:procedures',
        \'c:constants',
        \'T:subtypes',
        \'r:records',
        \'C:components',
        \'P:packages',
        \'l:locals'
    \]
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gundo plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ud :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ultisnips plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TxtBrowser plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"当切换到帮助buffer时，会改变其高亮设置
"autocmd BufEnter,WinEnter,BufNewFile,BufRead *.txt setlocal ft=txt

au BufNewFile,BufRead *.txt setlocal ft=txt
au BufRead,BufNewFile *.log setlocal ft=txt


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => riv plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let proj1 = { 'path': '$VIMHOME/VimWiki/public/rst',}
let g:riv_projects = [proj1]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimwiki plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype vimwiki map <F5> :Vimwiki2HTML<cr>
au filetype vimwiki map <C-F5> :Vimwiki2HTMLBrowse<cr>
au filetype vimwiki map <F6> :VimwikiAll2HTML<cr>
au filetype vimwiki nmap <leader>wl :VimwikiToggleListItem<cr>
au filetype vimwiki setl tw=0

" 多个维基项目的配置
let wiki_1 = {}
let wiki_1.path = '$VIMHOME/VimWiki/public/wiki/'
let wiki_1.path_html = '$VIMHOME/VimWiki/public/html/'
let wiki_1.template_path = '$VIMHOME/VimWiki/public/vimwiki_template/'
let wiki_1.template_default = 'misc'
let wiki_1.template_ext = '.html'
let wiki_1.nested_syntaxes = {'asm': 'asm', 'c': 'c', 'cpp': 'cpp',
            \ 'css': 'css', 'js': 'javascript',
            \ 'perl': 'perl', 'python': 'python', 'java': 'java',
            \ 'php': 'php', 'html': 'html', 'bash': 'sh', 'vim': 'vim',
            \ 'make': 'make'}
let wiki_1.index = 'main'
let wiki_1.ext = '.wiki'

let wiki_2 = {}
let wiki_2.path = '$VIMHOME/VimWiki/private/wiki/'
let wiki_2.index = 'main'

let g:vimwiki_list = [wiki_1, wiki_2]

" 设置编码
let g:vimwiki_w32_dir_enc = 'utf-8'

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

"Use VimwikiHeader1-VimwikiHeader6 group colors to highlight
let g:vimwiki_hl_headers=1

" Checked list items can be highlighted with a color
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

" 声明可以在wiki里面使用的HTML标签
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right'
let g:vimwiki_valid_html_tags=''

" 'path_html'路径下的这些文件不会被命令:VimwikiAll2HTML自动删除
let g:vimwiki_user_htmls = '404.html,search.html,google8befba0c77dd0855.html'

" 从2级标题开始自动给标题编号
"let g:vimwiki_html_header_numbering=2
" 标题编号后跟' '
"let g:vimwiki_html_header_numbering_sym=' '

"let g:vimwiki_browsers=['firefox']

"let g:vimwiki_ext2syntax = {'.md': 'mkd',
      "\ '.mkd': 'mkd',
      "\ '.markdown': 'mkd'}

let g:vimwiki_dir_link='main'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fcitx plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if g:ostype=='unix'
    ""##### auto fcitx  ###########
    "let g:input_toggle = 1
    "function! Fcitx2en()
        "let s:input_status = system("fcitx-remote")
        "if s:input_status == 2
            "let g:input_toggle = 1
            "let l:a = system("fcitx-remote -c")
        "endif
    "endfunction

    "function! Fcitx2zh()
        "let s:input_status = system("fcitx-remote")
        "if s:input_status != 2 && g:input_toggle == 1
            "let l:a = system("fcitx-remote -o")
            "let g:input_toggle = 0
        "endif
    "endfunction

    "set ttimeoutlen=150
    ""退出插入模式
    ""autocmd InsertLeave * call Fcitx2en()
    ""进入插入模式
    ""autocmd InsertEnter * call Fcitx2zh()
    ""##### auto fcitx end ######
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SingleCompile plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gist-vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    let g:gist_clip_command = 'xclip -selection clipboard'
elseif g:ostype=='mac'
    let g:gist_clip_command = 'pbcopy'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => color schemes plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors-jellybeans
" Dark color scheme, inspired by ir_black and twilight
" Designed primarily for a graphical Vim, but includes support for 256, 88,
" 16, and 8 color terminals. On a 16 or 8 color terminal, replace its colors
" with those in  ansi-term-colors.txt  for best results.
" If you can’t or don’t want to change your terminal’s color mappings,d:
"if (!has("gui_running"))
  "let g:jellybeans_use_lowcolor_black = 0
"endif
"colorscheme jellybeans

" Colors Scheme molokai
" Set to match the original monokai background color
let g:molokai_original = 1
" Attempts to bring the 256 color version as close as possible to the the
" default (dark) GUI version.
let g:rehash256 = 1
colors molokai

" Colors Scheme seoul256
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 236
"colo seoul256
" Light color scheme
"colo seoul256-light
" Switch
"set background=dark
"set background=light


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SimpylFold plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fold all docstrings
autocmd FileType python setlocal foldlevel=2
"do not fold imports
let g:SimpylFold_fold_import = 0
"enable previewing of folded classes' and functions' docstrings in the
"fold text
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_DefaultMode = 2
