" 
" Specialized vimrc file
" By: Yuan Zhang
"

" 快捷键
" 定义快捷键的前缀，即<leader>
let mapleader=";"
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗
nnoremap <Leader>jw <C-W>j

" insert模式下光标移动
" Alt + H            光标移当前行行首
imap ˙ <ESC>I
" Alt + J            光标移下一行行首
imap ∆ <ESC><Down>I
" Alt + K            光标移上一行行尾
imap ˚ <ESC><Up>A
" Alt + L            光标移当前行行尾
imap ¬ <ESC>A
" Ctrl  + H            光标左移一格
imap <c-h> <Left>
" Ctrl  + J            光标下移一格
imap <c-j> <Down>
" Ctrl  + K            光标上移一格
imap <c-k> <Up>
" Ctrl  + L            光标右移一格
imap <c-l> <Right>


" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu



" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'lyokha/vim-xkbswitch'
" 插件列表结束
call vundle#end()


" 设定配色方案
"set background=dark
"colorscheme slate
colorscheme molokai
"colorscheme phd


" 辅助信息
" 显示行号
set number 
" 突出显示当前行
set cursorline 
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
" 打开状态栏标尺
set ruler 
" 搜索时高亮显示被找到的文本
set hlsearch 


" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on


" 缩进
" 自适应不同语言的智能缩进
filetype indent on
" 将tab自动展开为空格"
set expandtab
" 设定 << 和 >> 命令移动时的宽度为 4
" 设定 tab 长度为 4
set tabstop=4 
set shiftwidth=4 
" 使得按退格键时可以一次删掉 4 个空格
set softtabstop=4
" 把当前行的对起格式应用到下一行； 
set autoindent 
" 开启新行时使用智能自动缩进
set smartindent 
"只在python文件将tab展开成空格"
"autocmd FileType python set expandtab"
" 退格键删除缩进和行
set backspace=indent,eol,start




" 折叠 
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 设置折叠区域的宽度
set foldcolumn=3
" 设置折叠层数为
set foldlevel=99




" YouCompleteMe
" YCM全局配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全			
let g:ycm_seed_identifiers_with_syntax=1
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
" 补全后自动关闭补全窗口
let g:ycm_autoclose_preview_window_after_completion = 1

" 跳转到定义/声明
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>


" 标签/查找/替换暂时使用原生...


" vim-markdown-preview
let vim_markdown_preview_github=1
let g:path_to_chrome = "/Applications/Google Chrome.app"

" C++ 特性
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>



" F5 run program
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python %"
        elseif &filetype == 'html'
                exec "!open -a \"Google Chrome\" %"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'markdown'
                exec "!open -a \"Google Chrome\" %"
        endif
endfunc



" F7 NERDTree
nnoremap <space> za
map <F7> :NERDTreeToggle<CR>
" 设置宽度
let NERDTreeWinSize=15
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示/隐藏 MiniBufExplorer 窗口
map <F3> :MBEToggle<CR>
" buffer 切换快捷键
map <leader>. :MBEbn<CR>
map <leader>, :MBEbp<CR>


" 中文切换(https://juejin.im/entry/5be8eb8c6fb9a049c231f3c5)
let g:XkbSwitchEnabled = 1
