"=============================================================================
"      FileName: plugins_config.vim
"   Description: 插件的相关配置，请确保至少已加载 basic.vim
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"      HomePage: http://yysfire.github.io
"  Last Changed: 2020-12-23 19:31
"=============================================================================

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('$VIMFILES/plugged')

" Make sure you use single quotes

"Fuzzy file, buffer, mru, tag, etc finder.
"Plug 'kien/ctrlp.vim'
"Quickly locate files, buffers, mrus, ... in large project.
Plug 'Yggdroot/LeaderF', { 'commit': '67d8ae7478da186f3b246277801ef04d278a4257' }
"Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
"Alternate Files quickly (.c --> .h etc)
Plug 'vim-scripts/a.vim'
"A fancy start screen for Vim.
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Code Completion Section
if has("python") || has("python3")
  "The ultimate snippet solution for Vim.
  Plug 'SirVer/ultisnips'
endif
"vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'honza/vim-snippets'
"Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
"Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

Plug 'ncm2/ncm2'
" ncm2 requires nvim-yarp
Plug 'roxma/nvim-yarp'
if !has('nvim')
  " for vim8: nvim-yarp requires vim-hug-neovim-rpc
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" some completion sources
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"if g:ostype!='windows'
"  Plug 'ncm2/ncm2-jedi'
"endif
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'
Plug 'ncm2/ncm2-ultisnips'

"Surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
"easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

Plug 'vim-scripts/matchit.zip'

Plug 'scrooloose/nerdcommenter'

if v:version < 800
  "Syntax checking hacks
  Plug 'scrooloose/syntastic'
else
  Plug 'w0rp/ale'
endif

"Code Compile and Run
Plug 'xuhdev/SingleCompile'

" Syntax/Indent Section
"Text filtering and alignment
"must come before vim-markdown
Plug 'godlygeek/tabular'
"Markdown Vim Mode
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Vastly improved Javascript indentation and syntax support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"HTML5 + inline SVG omnicomplete funtion, indent and syntax
Plug 'othree/html5.vim', { 'for': 'html' }
"No-BS Python code folding
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
"Configuration for Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Go development plugin
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'pearofducks/ansible-vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
" TypeScript Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Other Utils
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'Rykka/riv.vim', { 'for': 'rst' }
Plug 'gu-fan/InstantRst', { 'for': 'rst' }
"A plugin for making Vim plugins
Plug 'tpope/vim-scriptease'
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }

"Sneak is a minimalist, versatile Vim motion plugin that
"jumps to any location specified by two characters.
Plug 'justinmk/vim-sneak'
"Switch between single-line and multiline forms of code
Plug 'AndrewRadev/splitjoin.vim'

"Plug 'Rykka/colorv.vim'

" Git Section
"A Git wrapper so awesome
Plug 'tpope/vim-fugitive'
"A git commit browser.
Plug 'junegunn/gv.vim'
"A vimscript for creating gists,curl is required
Plug 'mattn/gist-vim'
"Required by gist-vim
Plug 'mattn/webapi-vim'

" Colorscheme Section
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/seoul256.vim'

if has("python") || has("python3")
  "Graph your Vim undo tree in style.
  Plug 'sjl/gundo.vim'
  "Lean & mean status/tabline for vim that's light as air.
  Plug 'bling/vim-airline'
  "A nicer Python indentation style
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  Plug 'aquach/vim-mediawiki-editor', { 'do': ':!pip install mwclient' }
  "Plug 'yysfire/vim-mediawiki-editor', { 'branch': 'dev', 'do': ':!pip install mwclient' }
endif

" This plugin allows vim to use Racer for Rust code navigation.
Plug 'racer-rust/vim-racer'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

if g:ostype=='unix' && !has("win32unix")
    "Plug 'fcitx.vim'
    Plug 'chrisbra/SudoEdit.vim'
endif

" Initialize plugin system
" All of your Plugins must be added before the following line
call plug#end()

" Local plugins
set rtp+=$VIMFILES/TxtBrowser/
set rtp+=$VIMFILES/localbundle/*/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python env
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='windows'
  let s:python_local_version = substitute(system("python -c 'import sys; print(sys.version_info.major)' 2>/dev/null"), '\n\+$', '', '')
else
  let s:python_local_version = substitute(system("$(which python) -c 'import sys; print(sys.version_info.major)' 2>/dev/null"), '\n\+$', '', '')
endif


""""""""""""""""""""""""""""
"  vim-python-pep8-indent  "
""""""""""""""""""""""""""""
if filereadable(expand("$VIMFILES/plugged/vim-python-pep8-indent/indent/python.vim"))
    let g:pymode_indent = 0
endif


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
call SingleCompile#SetCompilerTemplate('typescript', 'tsc', 'TypeScript Compiler',
             \'tsc', '--strictNullChecks', 'ts-node $(FILE_NAME)$')
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>


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

let g:tagbar_type_mediawiki = {
      \ 'ctagstype' : 'mediawiki',
      \ 'kinds' : [
      \'h:chapters',
      \'s:sections',
      \'u:subsections',
      \'b:subsubsections',
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
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:snips_author="yysfire"
let g:snips_email="yysfire[at]gmail"
let g:snips_github="https://github.com/yysfire"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]

au FileType python UltiSnipsAddFiletypes python.django

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
let g:riv_global_leader = "<\Space>"


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
            \ 'css': 'css', 'js': 'javascript', 'json': 'json',
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
" => gist-vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    let g:gist_clip_command = 'xclip -selection clipboard'
elseif g:ostype=='mac'
    let g:gist_clip_command = 'pbcopy'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0
let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1
" Only :w! updates a gist.
let g:gist_update_on_write = 2


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
let g:SimpylFold_fold_docstring = 1
autocmd FileType python setlocal foldlevel=2
"do not fold imports
let g:SimpylFold_fold_import = 0
"enable previewing of folded classes' and functions' docstrings in the
"fold text
let g:SimpylFold_docstring_preview = 1
autocmd FileType python setlocal foldexpr=SimpylFold#FoldExpr(v:lnum) foldmethod=expr


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_DefaultMode = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:go_bin_path = expand("$GOROOT/bin")
"Enable syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"Disable opening browser after posting your snippet to play.golang.org
let g:go_play_open_browser = 0
"Fix some issues when using vim-go with Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" 所有命令的输出都用locationlist(lnext, lprevious, lclose)
let g:go_list_type = "locationlist"
" 保存文件时，在格式化代码的同时，自动导入未导入的模块
let g:go_fmt_command = "goimports"
" use the popup-window for |K| and |:GoDoc|
let g:go_doc_popup_window = 1
" Specifies the linters to enable for the |:GoMetaLinter| command.
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" command run in a new terminal asynchronously in the background
let g:go_term_enabled = 1
let g:go_term_mode = "vsplit"
" g:go_term_mode = 'split' 时有效
let g:go_term_height = 10
" g:go_term_mode = 'vsplit' 时有效
let g:go_term_width = 30

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>gt  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>gr  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

  " :GoDeclsDir
  autocmd FileType go nmap <leader>gdd :GoDeclsDir<cr>

  " :GoInfo
  autocmd FileType go nmap <Leader>gi <Plug>(go-info)

  " :GoMetaLinter
  " 使用Ale
  "autocmd FileType go nmap <Leader>gl <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>gv <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>gs <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  " 自动补全快捷键
  autocmd Filetype go imap <C-Space> <C-x><C-o>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_style_pythonic = 0
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 1
let g:vim_markdown_no_default_key_mappings = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
"If set 1, do not require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 0
"Auto-write when following link
let g:vim_markdown_autowrite = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
"TOML syntax highlight requires vim-toml
let g:vim_markdown_toml_frontmatter = 1
"JSON syntax highlight requires vim-json
let g:vim_markdown_json_frontmatter = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown-preview.vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_path_to_chrome = "GoogleChromePortable"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁用 python-mode 的语法检查
let g:pymode_lint = 0
""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '**'
let g:airline#extensions#ale#enabled = 1
"显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 文件内容改变时不实时检查
let g:ale_lint_on_text_changed = 'never'
" 打开文件时不启用检查
let g:ale_lint_on_enter = 0
let g:ale_python_mypy_options = '--ignore-missing-imports'
if s:python_local_version == 3
    let g:ale_python_flake8_executable = g:python3_host_prog
else
    let g:ale_python_flake8_executable = g:python_host_prog
    let g:ale_python_mypy_options .= ' --py2'
endif
let g:ale_python_flake8_options = '-m flake8 --max-line-length=240'
"let g:ale_python_mypy_ignore_invalid_syntax = 1
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

let g:ale_linters = {
            \'python': ['flake8', 'mypy'],
            \'go': ['golangci-lint', 'gofmt', 'golint'],
            \}
let g:ale_go_golangci_lint_options = ''
"let g:ale_fixers = {
"            \'python': [
"            \    'isort',
"            \    'autopep8',
"            \    'yapf',
"            \    ],
"            \}
let g:ale_fixers = {
            \'python': [
            \    'isort',
            \    'black',
            \    ],
            \}
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-mediawiki-editor plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mediawiki_editor_url = '172.16.173.2'
let g:mediawiki_editor_uri_scheme = 'http'
let g:mediawiki_editor_path = '/wiki/'
let g:mediawiki_editor_username = 'yys'
let g:mediawiki_editor_password = '5BiUVhdPx6HPk2JaH3bY'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-completion-manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""expanding snippet in the popup menu with <Enter> key
"imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
"imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-l>":"\<CR>")

""popup all snippets for current buf with <C-L> key
"let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
"let g:UltiSnipsRemoveSelectModeMappings = 0
"inoremap <silent> <c-l> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

""Use <TAB> to select the popup menu:
""inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
""inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ncm2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" :help Ncm2PopupOpen for more information
au User Ncm2PopupOpen set completeopt=menuone,noinsert,noselect
au User Ncm2PopupClose set completeopt=menuone

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

"let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsRemoveSelectModeMappings = 0


""""""""""""""""""
" => vim-racer  "
""""""""""""""""""
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap <leader>gs <Plug>(rust-def-split)
au FileType rust nmap <leader>gv <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


""""""""""""""""""""""""""""""
"  => LanguageClient-neovim  "
""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }
let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, {'python': ['pyls']})

let b:lc_filetypes = join(keys(g:LanguageClient_serverCommands), ',')
execute "autocmd FileType " . b:lc_filetypes . " setlocal completefunc=LanguageClient#complete"
execute "autocmd FileType " . b:lc_filetypes . " nnoremap gc :call LanguageClient_contextMenu()<CR>"
" Or map each action separately
execute "autocmd FileType " . b:lc_filetypes . " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>"
execute "autocmd FileType " . b:lc_filetypes . " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>"
execute "autocmd FileType " . b:lc_filetypes . " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>"
execute "autocmd FileType " . b:lc_filetypes . " nnoremap <silent> grn :call LanguageClient#textDocument_rename()<CR>"
execute "autocmd FileType " . b:lc_filetypes . " nnoremap <silent> gfm :call LanguageClient#textDocument_formatting()<CR>"


"""""""""""""""
"  vim-shfmt  "
"""""""""""""""
let g:shfmt_extra_args = '-i 2 -ci -sr'
let g:shfmt_fmt_on_save = 1


""""""""""""""
"  SudoEdit  "
""""""""""""""
let g:sudo_askpass='/usr/lib/openssh/gnome-ssh-askpass'
