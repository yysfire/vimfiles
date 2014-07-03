"=============================================================================
"      FileName: extended.vim
"   Description: ���ļ�ӳ���˲������õĿ�ݼ����ɴ�����Ч��
"                ʹ��ǰ��ȷ���Ѽ����˻��������ļ� basic.vim
"        Author: �Ĺ����( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 4.5
"   Last Update: 2014-07-03 14:14
"=============================================================================
" ��ݼ���ǰ������Ϊ���ţ�Ĭ��ֵ�Ƿ�б�� '\'
let mapleader = ","
let g:mapleader = ","

" �ֺ�Ҳ�ɽ���EX����ģʽ
nnoremap ; :

" ���ٱ���
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>wf :w!<cr>
" �����˳�
nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
nmap <Leader>q  :call CustomExit()<CR>
nmap <Leader>qf <Esc>:call CustomExit()!<CR>

" �����л��ļ������ʽ
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
nmap <leader>fm :se ff=mac<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => �����ȫ���л�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='windows' && has('gui_running')
  let g:ScreenFlag = "Nomal"
  function! ToggleScreen()
    if g:ScreenFlag == "Max"
      let g:ScreenFlag = "Full"
      simalt ~x
      call libcallnr("vimtweak.dll", "EnableCaption", 0)
    elseif g:ScreenFlag == "Full"
      let g:ScreenFlag = "Nomal"
      call libcallnr("vimtweak.dll", "EnableCaption", 1)
      simalt ~r
    else
      let g:ScreenFlag = "Max"
      simalt ~x
    endif
  endfunction
  "F11 ��ʹgvim ��ȫ������ͨģʽ���л�
  map <F11> :call ToggleScreen()<CR>
  imap <F11> <Esc>:call ToggleScreen()<CR>
  map <C-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 200)<CR>
  map <S-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ���ٱ༭�����������ļ�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
  map <silent> <leader>ee :e $VIMHOME/.vimrc<cr>
  map <silent> <leader>ss :source $VIMHOME/.vimrc<cr>
  au! bufwritepost .vimrc,basic.vim,extended.vim,file_related.vim,plugins_config.vim source $VIMHOME/.vimrc
elseif g:ostype=='windows'
  map <silent> <leader>ee :e $VIMHOME/_vimrc<cr>
  map <silent> <leader>ss :source $VIMHOME/_vimrc<cr>
  au! bufwritepost _vimrc,basic.vim,extended.vim,file_related.vim,plugins_config.vim source $VIMHOME/_vimrc
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �Զ������ļ�������޸�ʱ��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoUpdateChageTime
  au!
  au BufWritePre,FileWritePre *.{cpp,h,py,c,cc,hpp,vim,cxx,wiki},*vimrc call AutoUpdateTheLastUpdateInfo()
augroup END
function! AutoUpdateTheLastUpdateInfo()
  let s:original_pos = getpos(".")
  "exe 'normal gg'
  let s:regexp = '^\s*\([#"\*]\|\/\/\)\s\+[lL]ast[ -_]*\([uU]pdated\?\|[cC]hanged\?\|[mM]odif\(ied\|y\)\):'
  call cursor(1, 1)
  let s:lu = search(s:regexp)
  if s:lu != 0
    let s:update_str = matchstr(getline(s:lu), s:regexp)
    "call setline(s:lu, s:update_str . strftime(" %Y-%m-%d %H:%M:%S"))
    call setline(s:lu, s:update_str . strftime(" %Y-%m-%d %H:%M"))
    "call setpos(".", s:original_pos)
  endif
  call cursor(s:original_pos[1], s:original_pos[2], s:original_pos[3])
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => �ڻ���������ǩ���������ƶ����л�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ʹj/k����һ�����е��Զ����м��ƶ�
"map j gj
"map k gk

" ȥ�����������ĸ���
map <silent> <leader><cr> :noh<cr>

" �ڷָ�ڼ��л�
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" �ڻ��������л�
noremap <leader>bn :bnext!<CR>
noremap <leader>bp :bprev!<CR>

" ж�ص�ǰ������
map <leader>bd :call vimrcfunc#extend#BufcloseCloseIt()<cr>
" ж�����л�����,�����˳�Vim
"map <leader>ba :1,1000 bd!<cr>
map <leader>ba :1,1000 bd<cr>

" �½���ǩ
map <leader>tn :tabnew<cr>
" �رյ�ǰ��ǩ
map <leader>tc :tabclose<cr>
" �ر��������б�ǩ
map <leader>to :tabonly<cr>
" �ƶ���ǩ
map <leader>tm :tabmove
" �Ե�ǰ��������·��Ϊ����·�����±�ǩҳ��
" ������ͬһĿ¼�±༭�ļ�ʱ������
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" ����ǰ���ڵĹ���·������Ϊ��ǰ�ļ�����Ŀ¼
map <leader>lc :lcd %:p:h<cr>:pwd<cr>
" �Զ�����ǰ���ڵĹ���·������Ϊ��ǰ�ļ�����Ŀ¼
autocmd BufEnter * lcd %:p:h


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => һЩ���õ�ӳ��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal�Ϳ���ģʽ���� ALT+[jk] �����ƶ��ı���
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" MAC ���� Comamnd+[jk]
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" д�뻺����ʱ�Ƴ���β�Ķ���ո�diff�ļ�����
autocmd BufWrite *.py :call vimrcfunc#extend#RemoveTrailingWhitespace()
nmap <leader>dw :call vimrcfunc#extend#RemoveTrailingWhitespace()<cr>

" �Ƴ��ĵ��е� ^M ����
noremap <Leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" �����л�ճ��ģʽ�Ŀ����
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""
" => ����ģʽ�µ�����
""""""""""""""""""""""""""""""
" ѡ��һ������,�� * �� # ��ȫ�������������
vnoremap <silent> * :call vimrcfunc#extend#VisualSelection('f')<CR>
vnoremap <silent> # :call vimrcfunc#extend#VisualSelection('b')<CR>
" �ڶ���ʵ�ַ�ʽ
"vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" When you press gv you vimgrep after the selected text
" �� gv �� vimgrep ѡ�е��ı�
vnoremap <silent> gv :call vimrcfunc#extend#VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>gv :vimgrep // **/*.*<left><left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>rs you can search and replace the selected text
vnoremap <silent> <leader>rs :call vimrcfunc#extend#VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   :cw
"
" To go to the next search result do:
"   :cn
"
" To go to the previous search results do:
"   :cp
"
"map <leader>cp :botright cope<cr>

" ����<leader>cn,�����nerdcomment��������ͻ
map <leader>cx :cn<cr>
map <leader>cp :cp<cr>

" ��quickfix���ڵ���Ϣ����ճ�����±�ǩ��
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ����̨�����ӳ��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>evimrcfunc#extend#DeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ��д
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab time <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setl omnifunc=syntaxcomplete#Complete
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ��ת����Ҫ���й���cconv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����ת����
command! G2b :%!cconv -f UTF8-CN -t UTF8-HK
" ����ת����
command! B2g :%!cconv -f UTF8-HK -t UTF8-CN


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ƴд���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,sl ������ر�ƴд���
map <leader>sl :setlocal spell!<cr>

" �Ƶ���һ��ƴд����ĵ���
map <leader>sn ]s
" �Ƶ���һ��ƴд����ĵ���
map <leader>sp [s
" ����ƴд������õ�����ƴд��ȷ��
map <leader>si zg
" ����ƴд������õ�����ƴд�����
map <leader>sw zw
" ��ʾһ���й�ƴд���󵥴ʵ��б��ɴ���ѡ��
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ֻ��һ������������ֱ���˳������򣬾�ֻж�ص�ǰ������
function! CustomExit()
  if (winbufnr(2) == -1)
    q
  else
    bd
  endif
endfunction

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

