" 创建新文件时候自动执行
autocmd BufNewFile *.v,*.[ch],*.cpp set filetype=class_c
autocmd BufNewFile *.py set filetype=python_
autocmd BufNewFile *.sh,*.bash set filetype=shell_
autocmd BufNewFile *.m set filetype=matlab
autocmd BufNewFile *.v,*.py,*.m,*.[ch],*.sh,*.cpp exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'class_c'
		call setline(1, "//========================================================================")
		call setline(2, "//        author   : xiaomh                               ")
		call setline(3, "//        email    : maswell@maswll.tech     ")
		call setline(4, "//        creattime: ".strftime("%c"))
		call setline(5, "//========================================================================")
	endif
	if &filetype == 'python_'
		call setline(1,"#!/usr/bin/python")
		call setline(2,"# -*- coding: utf-8 -*-")
		call setline(3,"#========================================================================")
		call setline(4,"#        author   : xiaomh                               ")
		call setline(5,"#        email    : maswell@maswll.tech     ")
		call setline(6,"#        creattime: ".strftime("%c"))
		call setline(7,"#========================================================================")
	endif
	if &filetype == 'shell_'
		call setline(1,"#!/bin/bash")
		call setline(2,"# -*- coding: utf-8 -*-")
		call setline(3,"#========================================================================")
		call setline(4,"#        author   : xiaomh                               ")
		call setline(5,"#        email    : maswell@maswll.tech     ")
		call setline(6,"#        creattime: ".strftime("%c"))
		call setline(7,"#========================================================================")
	endif
	if &filetype == 'matlab'
		call setline(1,"%========================================================================")
		call setline(2,"%        author   : xiaomh                               ")
		call setline(3,"%        email    : maswell@maswll.tech     ")
		call setline(4,"%        creattime: ".strftime("%c"))
		call setline(5,"%========================================================================")
	endif
	autocmd BufNewFile * normal G
endfunc

" reopening a file                                                         
if has("autocmd")                                                          
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
endif 
"""快速插入 log
inorea ilog [ log by <c-r>=$USER<cr>@<c-r>=strftime("%Y%m%d %H:%M")<cr>]:
"""快速插入commit log
let $FILENAME=expand("%") " commit log
cnorea clog  <ESC>:new<CR><ESC>10<C-W>-:edit .${FILENAME}.gitcmlog<CR> 
" shift
inorea ;; <BS><ESC>  a <BS><BS>
inoremap ( () <ESC><Left>i
inoremap [ [] <ESC><Left>i
inoremap { {} <ESC><Left>i

inorea .. <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * se cul
" 设置字符编码                                                                
set fileencoding=utf-8                                             
set fileencodings=utf-8,cp936,euc-cn,gb2312,gb18030,latin1                      
set termencoding=utf-8                                             
set encoding=utf-8                                                 

" display
set showmatch
set matchtime=5
set number  " 显示行号                                                      
set hls

set nobackup
set incsearch
set nowrap
set ruler
set imcmdline
" 语法高亮                                                         
syntax on                                                          
" 深色背景                                                         

color evening 
" 检测文件类型                                                     
filetype on                                                        
" 根据文件类型加载对应的插件                                       
filetype plugin on                                                 
                                                                

" 高亮显示当前行                                                   
set cursorline                                                     
                                                                   
" 设置各种缩进                                                     
set tabstop=4                                                      
set softtabstop=4                                                  
set shiftwidth=4                                                   
set autoindent                                                     
set smartindent                                                    
set cindent                                                        
" set expandtab " tab转换为空格                                                    
highlight CursorLine term=reverse
highlight CursorColumn term=reverse
"代码补全
set completeopt=preview,menu 
"自动保存
set autowrite
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=10
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
