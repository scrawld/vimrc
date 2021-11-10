" vimrc
set tags=tags;/
set t_u7=										" set t_u7= or set ambw=double 临时解决vim默认进入 REPLACE 模式(https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode)
set wrapscan                                    " 启用循环查找方式
set guifont=Monaco:h10                          " 字体 && 字号
"set expandtab                                   " 设置tab键换空格
set tabstop=4                                   " Tab键的宽度
set shiftwidth=4                                " 换行时行间交错使用4个空格
set autoindent                                  " 自动对齐
set backspace=2                                 " 设置退格键可用
set cindent shiftwidth=4                        " 自动缩进4空格
set smartindent                                 " 智能自动缩进
set ai!                                         " 设置自动缩进
set nu!                                         " 显示行号
set foldmethod=indent                           " 代码折叠方案
set showmatch                                   " 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号
set scrolloff=10                                " 光标移动到buffer的顶部和底部时保持3行距离
set autoread                                    " 设置当文件被改动时自动载入
set hlsearch                                    " 开启高亮显示结果
set incsearch                                   " 开启实时搜索功能
"set nowrapscan                                  " 搜索到文件两端时不重新搜索
set nocompatible                                " 关闭兼容模式
set vb t_vb=                                    " 关闭提示音
set noerrorbells                                " 关闭错误信息响铃
set cursorline                                  " 突出显示当前行
set laststatus=2                                " 启动显示状态行(1),总是显示状态行(2)
set noshowmode                                  " 关闭模式显示mode
set fenc=utf-8                                  " 设置编码
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set softtabstop=4                               " 使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格）
set noeb                                        " 去掉输入错误的提示声音
set langmenu=zh_CN.UTF-8                        " 语言设置
set helplang=cn
set shortmess=atI                               " 启动的时候不显示那个援助乌干达儿童的提示
set magic                                       " 设置魔法
set novisualbell                                " 不要闪烁
set showcmd                                     " 显示输入的命令
set fillchars=vert:\ ,stl:\ ,stlnc:\            " 在被分割的窗口间显示空白，便于阅读
set clipboard=unnamed                           " 共享剪贴板 
set nobackup                                    " 从不备份
set noswapfile                                  " 禁止生成临时文件
set ignorecase                                  " 搜索忽略大小写
set smartcase                                   " 如果有一个大写字母，则切换到大小写敏感查找
set guioptions-=T                               " 隐藏工具栏
set guioptions-=m                               " 隐藏菜单栏
set history=1000                                " 记录历史的行数
set termguicolors
set t_Co=256									" Make vim look better in putty.

syntax enable                                   " 打开语法高亮
syntax on                                       " 开启文件类型侦测
filetype indent on                              " 针对不同的文件类型采用不同的缩进格式
filetype plugin on                              " 针对不同的文件类型加载对应的插件
filetype plugin indent on                       " 启用自动补全

" ======= 恢复上次文件打开位置 ======= "
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
autocmd BufReadPost * normal! `"

" 为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"
" vundle
"
set rtp+=~/.vim/bundle/Vundle.vim               " 启用vundle来管理vim插件
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                    " 树形目录
Plugin 'ErichDonGubler/vim-sublime-monokai'     " 主题插件 https://vimcolors.com/
Plugin 'itchyny/lightline.vim'                  " 模式插件
Plugin 'SirVer/ultisnips'                       " tab补齐
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'                           " Go 插件 :GoInstallBinaries
Plugin 'nsf/gocode', {'rtp': 'vim/'}            " Go 自动补全
Plugin 'dhruvasagar/vim-table-mode'             " md table 格式化插件
Plugin 'tpope/vim-fugitive'						" Git 插件
Plugin 'kien/ctrlp.vim'							" 文件搜索
call vundle#end()               " required 
filetype plugin on              " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

"
" NERDTree
"
map <F7> :NERDTree<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=0						" 显示隐藏文件
let g:NERDTreeShowLineNumbers=1					" 显示行号
let g:NERDTreeWinSize=30
"let g:NERDTreeDirArrowExpandable='▸'
"let g:NERDTreeDirArrowCollapsible='▾'

"
" vim-sublime-monokai
"
colorscheme sublimemonokai
let g:sublimemonokai_term_italic = 1

"
" ctrlp
"
" Making CtrlP.vim load 100x faster — A Tiny Piece of Vim — Medm
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.emcvo89nx
let g:ctrlp_user_command = [
            \ '.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
            \ ]
let g:ctrlp_match_window       = 'bottom,order:btt,min:5,max:5,results:10'
let g:ctrlp_cmd                = 'CtrlPMixed'
let g:ctrlp_mruf_default_order = 1

"
" go-vim
"
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
"let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_version_warning = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let mapleader = "," " vim-go 快捷键
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>ref <Plug>(go-referrers)
command Gofs GoFillStruct

"
" ultisnips 设置注释块信息
"
let $ultisnips_author_name = "ziyang"
let $ultisnips_author_email = "jiayd163@163.com"

"
" Markdown
"
autocmd VimEnter *.md :TableModeToggle
autocmd FileType markdown nnoremap <F9> :TableModeToggle<CR>
