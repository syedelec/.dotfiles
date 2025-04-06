""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             NVIM Configuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Skip python check
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

set ttyfast

" In case GVIM is used
if has('gui_running')
    set guioptions=Mc
else
    set guioptions-=e
endif

" Theme config
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 0
let g:nord_underline = 1
let g:nord_italic = 0
let g:nord_italic_comments = 0
let g:nord_bold = 0

set background=dark
colorscheme nord

if has('termguicolors')
    " let &t_8f="\<esc>[38;2;%lu;%lu;%lum"
    " let &t_8b="\<esc>[48;2;%lu;%lu;%lum"

    " set vim-specific sequences for rgb colors super important
    " for truecolor support in vim
    set termguicolors
endif

" let g:terminal_color_0  = '#2E3440'
" let g:terminal_color_1  = '#3B4252'
" let g:terminal_color_2  = '#434C5E'
" let g:terminal_color_3  = '#4C566A'
" let g:terminal_color_4  = '#D8DEE9'
" let g:terminal_color_5  = '#E5E9F0'
" let g:terminal_color_6  = '#ECEFF4'
" let g:terminal_color_7  = '#8FBCBB'
" let g:terminal_color_8  = '#88C0D0'
" let g:terminal_color_9  = '#81A1C1'
" let g:terminal_color_10 = '#5E81AC'
" let g:terminal_color_11 = '#BF616A'
" let g:terminal_color_12 = '#D08770'
" let g:terminal_color_13 = '#EBCB8B'
" let g:terminal_color_14 = '#A3BE8C'
" let g:terminal_color_15 = '#B48EAD'

syntax on                                   " enable syntax color

filetype plugin indent on

set updatetime=0                            " update after N milliseconds

" set guicursor+=n-v-c:blinkwait700-blinkon400-blinkoff250
" set guicursor+=i-ci:ver10-blinkwait500-blinkon500-blinkoff500

" Show preview of subsitutions before performing it
if exists('&inccommand')
    set inccommand=nosplit
endif

set scrolloff=5

set autoread                                " reload files if changed outside VIM
set nofoldenable                            " don't fold lines

set undofile                                " persistent undo when closing files
set undolevels=30                           " maximum number of changes that can be undone
set undoreload=1000
set history=100                             " remember more commands and search history

set nobackup
set nowritebackup
set noswapfile

set synmaxcol=200                           " don't syntax highlight long lines

set mouse=a
set clipboard=unnamedplus


set showcmd                                 " show (partial) command in status line
set showmatch                               " show matching brackets
set noshowmode                              " do not show current mode

set noruler                                 " do not show the line and column numbers
set number                                  " show the line numbers on the left side
set formatoptions+=o                        " continue comment marker in new lines
set formatoptions+=1                        " don't break lines after a one-letter word
set formatoptions-=t                        " don't auto-wrap text
set textwidth=0                             " hard-wrap long lines as you type them

set expandtab                               " insert spaces when TAB is pressed
set copyindent                              " insert spaces when TAB is pressed.
set cindent                                 " set stricter rules for C programs
set smartindent                             " does the right thing (mostly) in programs
set preserveindent                          " insert spaces when TAB is pressed.
set tabstop=4                               " render TABs using this many spaces.
set shiftwidth=4                            " indentation amount for < and > commands.
set shiftround

if exists('&belloff')
    set belloff=all
endif

set novisualbell
set noerrorbells

set modeline                                " enable modeline.
set linespace=0                             " set line-spacing to minimum.
set nojoinspaces                            " prevents inserting two spaces after punctuation on a join (J)
set synmaxcol=400

set smartcase                               " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                                " insert tabs on the start of a line according to shiftwidth, not tabstop

set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.so,*.a,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

set hidden                                  " it hides buffers instead of closing them

" More natural splits
set splitbelow                              " horizontal split below current.
set splitright                              " vertical split to right of current.

" set list
set listchars=eol:¬,tab:»\ ,space:·,extends:>,precedes:<,trail:•

" highlight current line
set cursorline
" highlight current column
set cursorcolumn
" avoid putting crusor beggining of line
set nostartofline

set encoding=utf-8
set showtabline=2                           " always display tabline (not needed for vim-airline)
set laststatus=2                            " always display status line
set cmdheight=2                             " use a status bar that is 2 rows high

set wildmenu                                " make tab completion for files/buffers act like bash
set wildmode=full                           " shows a menu bar as opposed to an enormous list
set wildignorecase                          " ignore case when completing file names and directories
set completeopt=menuone,noinsert            " complete options

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Specific FT Configuration                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype sh,c,cpp setlocal colorcolumn=80
autocmd Filetype python setlocal colorcolumn=120

" autocmd Filetype gitcommit,gitrebase source $HOME/.config/nvim/config/.gitedit.vim

