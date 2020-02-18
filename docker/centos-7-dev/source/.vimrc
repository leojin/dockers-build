filetype off                " required
set encoding=utf-8
syntax on                   " 自动语法高亮
set nocompatible            " be iMproved, required
set wrap                    " 设置自动换行
set nocompatible            " 关闭 vi 兼容模式
set number                  " 显示行号
set nobackup                " 覆盖文件时不备份
set backupcopy=yes          " 设置备份时的行为为覆盖
set autoread                " set to auto read when a file changed from the outside
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set wrap                    " 自动换行
set magic                   " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 "编码设置
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\
set tabstop=4
set smarttab
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set expandtab               " 禁掉tab
set list "展示不可见字符
set listchars=tab:>-,trail:~,extends:>,precedes:<
set helplang=cn