" VIM setup file, reference from [https://github.com/yangyangwithgnu/use_vim_as_ide]

"   Basic setup {
   
    let mapleader=';' " 定义快捷键的前缀,即<Leader>

    filetype on " 开启文件类型侦测
    filetype plugin on " 根据侦测到的不同类型加载对应的插件

    " 定义快捷键到行首和行尾
    nmap LB 0
    nmap LE $

    " 设置快捷键将选中文本块复制至系统剪贴板
    vnoremap <Leader>y "+y
    " 设置快捷键将系统剪贴板内容粘贴至vim
    nmap <Leader>p "+p

    " 设置快捷键将选中文本块复制至系统剪贴板
    vnoremap <Leader>y "+y
    " 设置快捷键将系统剪贴板内容粘贴至vim
    nmap <Leader>p "+p

    " 依次遍历子窗口
    nnoremap nw <C-W><C-W> 
    " 跳转至右方的窗口
    nnoremap <Leader>lw <C-W>l 
    " 跳转至左方的窗口
    nnoremap <Leader>hw <C-W>h 
    " 跳转至上方的子窗口
    nnoremap <Leader>kw <C-W>k 
    " 跳转至下方的子窗口
    nnoremap <Leader>jw <C-W>j 

    " 定义快捷键在结对符之间跳转 
    nmap <leader>m % 

    " 让配置变更立即生效
    autocmd BufWritePost $MYVIMRC source $MYVIMRC 

    set incsearch " 开启实时搜索功能
    set ignorecase " 搜索时大小写不敏感
    set wildmenu " vim自身命令行模式智能补全

"   }

"   Plugin management {

    " vundle 环境设置
    set nocompatible              
    filetype off                 
    set rtp+=~/.vim/bundle/Vundle.vim/ 

    " vundle管理的插件列表必须位于
    " vundle#begin()和vundle#end()之间
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'suan/vim-instant-markdown'
    Plugin 'majutsushi/tagbar'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'dyng/ctrlsf.vim'
    Plugin 'kshenoy/vim-signature'
    Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
    Plugin 'vim-scripts/indexer.tar.gz'
    Plugin 'vim-scripts/DfrankUtil'
    Plugin 'vim-scripts/vimprj'
    Plugin 'vimwiki/vimwiki'
    Plugin 'itchyny/calendar.vim'

    " vundle 插件列表结束
    call vundle#end()

    filetype plugin indent on   

"   }

"   Beautify the UI {
    
    " 禁止光标闪烁
    set gcr=a:block-blinkon0

    " 禁止显示滚动条
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    " 禁止显示菜单和工具条
    set guioptions-=m
    set guioptions-=T

    " 设置GUI字体
    " set guifont=Nimbus\ Mono\ PS\ Bold\ 20
    set guifont=YaHei\ Consolas\ Hybrid\ 20

    " 设置主题
    "set background=light
    set background=dark
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    "if (has("termguicolors"))
        "set termguicolors
    "endif
    colorscheme solarized
    "colorscheme molokai
    "colorscheme phd

    " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
    "fun! ToggleFullscreen()
	"    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    "endf
    " 全屏开/关快捷键
    "map <silent> <F11> :call ToggleFullscreen()<CR>
    " 启动 vim 时自动全屏
    "autocmd VimEnter * call ToggleFullscreen()

    set laststatus=2 " 总是显示状态栏
    set ruler " 显示光标当前位置
    set number " 开启行号显示
    set cursorline " 高亮显示当前行
    set cursorcolumn " 高亮显示当前列
    "set nohlsearch " 不高亮显示搜索结果
    set hlsearch " 高亮显示搜索结果
    set nowrap " 禁止折行

    "** Powerline setup **"
    set t_Co=256
    set encoding=utf8
    let g:Powerline_symbols='unicode'
    let g:Powerline_colorscheme='solarized256'

"   }

"   Code analysis {
    
    syntax enable " 开启语法高亮功能
    syntax on " 允许用指定语法高亮配色方案替换默认方案

    set shiftwidth=4 " 设置格式化时制表符占用空格数 
    set tabstop=4 " 设置编辑时制表符占用空格数
    set softtabstop=4 " 让vim把连续数量的空格视为一个制表符
    set expandtab " 将制表符扩展为空格
    " set smartindent 
    filetype indent on " 自适应不同语言的智能缩进

    " set foldmethod=syntax " 基于语法进行代码折叠
    set foldmethod=indent " 基于缩进进行代码折叠
    set nofoldenable " 启动vim时关闭折叠代码
    "set foldenable " 启动vim时不关闭折叠代码 
    
    "** fswitch setup **"
    " *.cc 和 *.h 间切换 
    nmap <silent> <Leader>sw :FSHere<cr> 

    "** Vim-signature setup **"
    " vim-Signature 快捷键配置
    let g:SignatureMap = { 
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
    "mx: 设定/取消当前行名为x的标签
    "m,: 自动设定下一个可用书签名
    "mda: 删除当前文件中所有独立书签
    "m/: 罗列出当前文件中所有书签,选中后回车可直接跳转
    "mn: 按行号前后顺序,跳转至下个独立书签
    "mp: 按行号前后顺序,跳转至前个独立书签
    
    "** tagbar setup **"
    let tagbar_left=1 " 设置tagbar子窗口的位置出现在主编辑区的左边
    " 设置显示/隐藏标签列表子窗口的快捷键
    nnoremap <Leader>ilt :TagbarToggle<CR> 
    let tagbar_width=20 " 设置标签子窗口的宽度
    let g:tagbar_compact=1 " tagbar子窗口中不显示冗余帮助信息
    " 设置ctags对哪些代码标识符生成标签
    let g:tagbar_type_cpp = {
        \ 'kinds' : [
        \ 'c:classes:0:1',
        \ 'd:macros:0:1',
        \ 'e:enumerators:0:0',
        \ 'f:functions:0:1',
        \ 'g:enumeration:0:1',
        \ 'l:local:0:1',
        \ 'm:members:0:1',
        \ 'n:namespaces:0:1',
        \ 'p:functions_prototypes:0:1',
        \ 's:structs:0:1',
        \ 't:typedefs:0:1',
        \ 'u:unions:0:1',
        \ 'v:global:0:1',
        \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',                                                                                                                                                     
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
    \ }

    "** Tags setup **"
    " 正向遍历同名标签
    nmap <Leader>tn :tnext<CR>
    " 反向遍历同名标签
    nmap <Leader>tp :tprevious<CR>

    "** indexer setup **"
    " 设置插件indexer调用ctags的参数
    " 默认--c++-kinds=+p+l，重新设置为--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
    " 默认--fields=+iaS不满足YCM要求，需改为--fields=+iaSl
    let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

"   }

"   Code development {
   
    "** UltiSnips setup **"
    let g:UltiSnipsExpandTrigger='<leader><tab>'
    let g:UltiSnipsJumpForwardTrigger='<leader><tab>'
    let g:UltiSnipsJumpBackwardTrigger='<leader><s-tab>'
    let g:UltiSnipsUsePythonVersion=2
    let g:UltiSnipsSnippetDirectories=["mysnippets"]

    "** YouCompleteMe setup **"
    " YCM 补全菜单配色
    " highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D4
    " highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900 
    " 补全功能在注释中同样有效
    let g:ycm_complete_in_comments=1 
    " 允许vim加载.ycm_extra_conf.py文件，不再提示
    let g:ycm_confirm_extra_conf=0 
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    " 开启YCM标签补全引擎
    let g:ycm_collect_identifiers_from_tags_files=1 
    " YCM集成OmniCppComplete补全引擎，设置其快捷键
    inoremap <leader>; <C-x><C-o> 
    " 禁止缓存匹配项，每次都重新生成匹配项
    let g:ycm_cache_omnifunc=0 
    " 从第一个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=1 
    " 补全内容不以分割子窗口形式出现，只显示补全列表
    set completeopt-=preview 
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1 

    " 跳转至声明
    nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
    " 跳转至定义，只能是#include或已打开的文件
    nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    
    "** ctrlsf setup **"
    " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
    nnoremap <Leader>sp :CtrlSF<CR>

"   }

"   Engineering management {
    
    "** NERDtree setup **"
    " 使用 NERDTree 插件查看工程文件
    nmap <Leader>fl :NERDTreeToggle<CR>
    " 设置NERDTree子窗口宽度
    let NERDTreeWinSize=20 
    " 设置NERDTree子窗口位置
    let NERDTreeWinPos="right" 
    " 显示隐藏文件
    let NERDTreeShowHidden=1 
    " NERDTree子窗口中不显示冗余帮助信息
    let NERDTreeMinimalUI=1 
    " 删除文件时自动删除文件对应buffer
    let NERDTreeAutoDeleteBuffer=1 

    "** MiniBufExplorer setup **"
    " 显示/隐藏 MiniBufExplorer 窗口
    " nmap <Leader>bl :MBEToggle<cr>
    " buffer 切换快捷键
    " nmap <C-Tab> :MBEbn<cr> 
    " nmap <C-S-Tab> :MBEbp<cr>
    
    "** CtrlP setup **"
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'

"   }
    
"   Other {
    "** VimWiki setup **"
    "let g:vimwiki_menu = ''

    "let wiki_1 = {}
    "let wiki_1.path = '/run/media/shulwang/MyData0/Document/ShuleiWiki'
    "let wiki_1.syntax = 'markdown'
    "let wiki_1.ext = '.md'

    "let g:vimwiki_list = [wiki_1]
    "let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

    "** Calendar setup **"
    "map <F8> :Calendar<cr>
  
"   }

