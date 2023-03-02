""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugins installation                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
    " Color scheme
    Plug 'arcticicestudio/nord-vim'

    " Git integration
    Plug 'airblade/vim-gitgutter'

    " Fuzzy files/tags/snippets ... finder - CtrlP replacement
    " Generate only the binary
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

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

    " Status bar information (lighter) and tabline for buffers
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'

    " Alignment plugin
    Plug 'junegunn/vim-easy-align'

    " nvim tree-sitter configurations
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Built-in LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'ojroques/nvim-lspfuzzy'

    " Fast left-right movement
    " Plug 'unblevable/quick-scope'

    " Git wrapper.. need more time
    " Plug 'tpope/vim-fugitive'

    " Multi cursor support
    " Plug 'mg979/vim-visual-multi'

    " Icons for filetypes on multiple plugins
    " Plug 'ryanoasis/vim-devicons'

call plug#end()

