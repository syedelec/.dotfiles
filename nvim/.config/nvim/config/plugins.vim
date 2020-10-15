""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugins installation                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
    " Color scheme
    Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

    " Git integration
    Plug 'airblade/vim-gitgutter'

    " Fuzzy files/tags/snippets ... finder - CtrlP replacement
    " Generate only the binary
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Completion server
    Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

    " Sane buffer/window deletion
    Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}

    " bitbake syntax
    Plug 'kergoth/vim-bitbake'

    " Snippets manager
    Plug 'SirVer/ultisnips'

    " Defx tree explorer
    if has('nvim')
        Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/defx.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " Defx icons and git integration
    Plug 'kristijanhusak/defx-icons'
    Plug 'kristijanhusak/defx-git'

    " White spaces handler
    Plug 'ntpeters/vim-better-whitespace'

    " Comments handler
    Plug 'tpope/vim-commentary'

    " Undo graph history
    Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}

    " Sublime text move line style
    Plug 'matze/vim-move'

    " Fancy start screen
    Plug 'mhinz/vim-startify'

    " Re-open last files at previous location
    Plug 'farmergreg/vim-lastplace'

    " illuminate other uses of the word under the cursor
    Plug 'rrethy/vim-illuminate'

    " display the colours in the file
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    " Search, substition and abbreviation
    Plug 'tpope/vim-abolish'

    " Fade unsued buffer
    Plug 'TaDaa/vimade'

    " Tabline for buffers
    Plug 'ap/vim-buftabline'

    " Alignment plugin
    Plug 'junegunn/vim-easy-align'

    " Built-in LSP
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'

    " Tabline for buffers/tabs
    " Plug 'zefei/vim-wintabs'

    " Visual selection of whitespaces
    " Plug 'emilyst/vim-xray'

    " Use tabs on top of vim
    " Plug 'bagrat/vim-buffet'

    " Fast left-right movement
    " Plug 'unblevable/quick-scope'

    " Git wrapper.. need more time
    " Plug 'tpope/vim-fugitive'

    " Status bar information
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    " Status bar information (lighter)
    " Plug 'itchyny/lightline.vim'
    " Plug 'mgee/lightline-bufferline'
    " Plug 'bling/vim-bufferline'

    " Manages tags
    " Plug 'ludovicchabant/vim-gutentags', {'for': ['c', 'cpp']}

    " Sessions management
    " Plug 'tpope/vim-obsession', {'on': 'Obsession'}

    " Open help in tab
    " Plug 'airblade/vim-helptab'
    " Plug 'zefei/vim-wintabs'

    " Pair [{("''")}]
    " Plug 'jiangmiao/auto-pairs'

    " Function completion
    " Plug 'Shougo/echodoc.vim'
    " Plug 'ervandew/supertab'

    " Multi cursor support
    " Plug 'mg979/vim-visual-multi'

    " Plug 'ap/vim-css-color'
    " Plug 'chrisbra/Colorizer'

    " Tags generation
    " Plug 'szw/vim-tags'

    " Icons for filetypes on multiple plugins
    " Plug 'ryanoasis/vim-devicons'

    " Plug 'airblade/vim-rooter'

    " " Completion framework
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    " Plug 'zchee/deoplete-clang'

    " Plug 'itchyny/vim-cursorword'

    " Lint checker
    " Plug 'w0rp/ale'

    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'haya14busa/incsearch.vim'
    " Plug 'haya14busa/incsearch-fuzzy.vim'

    " Plug 'tpope/vim-surround'
    " Plug 'Shougo/echodoc.vim'
    " let g:echodoc_enable_at_startup = 1

    " Plug 'nathanaelkane/vim-indent-guides'
    " Plug 'ervandew/supertab'

    " " Quick find and replace
    " Plug 'hauleth/sad.vim'

call plug#end()

