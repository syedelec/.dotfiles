""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Basic Configuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
if &compatible
    set nocompatible
endif

if !executable('curl')
    echoerr 'please install curl'
    echoerr ''
    exit(-1)
endif

if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         NVIM sources configuration                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/config.vim
source $HOME/.config/nvim/config/plugins_settings.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/mapping.vim

