"=============================================================================
"      FileName: .vimrc
"   Description: ���ڼ��������ĸ������ļ�
"        Author: �Ĺ����( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 6.0
"  Last Changed: 2014-07-01 15:06:41
"       History:
"=============================================================================
" za                            --չ��������ǰ�۵�
" zi                            --չ�������������۵�
" zM                            --���������۵���'foldlevel'��Ϊ0
" zR                            --չ�������۵���'foldlevel'��Ϊ��߼���
"
" :%!xxd                        --ת���������ļ�����ʮ��������ʽ��ʾ
" :%!xxd -r                     --��ԭ�������ļ�
"
" �ж���ǰ����ϵͳ����
if(has("win32")||has("win95")||has("win64")||has("win16")||has("dos32")||has("dos16"))
    let g:ostype='windows'
    let g:system_spliter='\'
elseif(has("mac")||has("macunix"))
    let g:ostype='mac'
    let g:system_spliter='/'
else
    let g:ostype='unix'
    let g:system_spliter='/'
endif

" ͳһ��ͬƽ̨�ϵĻ�������
if g:ostype=='windows'
    let $VIMHOME = $VIM
    let $VIMFILES = $VIMHOME.'/vimfiles'
else
    let $VIMHOME = $HOME
    let $VIMFILES = $VIMHOME.'/.vim'
endif

source $VIMFILES/basic.vim
source $VIMFILES/extended.vim
source $VIMFILES/file_related.vim
source $VIMFILES/plugins_config.vim
