""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Plugin Settings & Mappings                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General {
    " Disable pre-bundled plugins
    let g:loaded_getscript = 1
    let g:loaded_getscriptPlugin = 1
    let g:loaded_gzip = 1
    let g:loaded_logiPat = 1
    let g:loaded_matchit = 1
    " Show brackets matching (do not disable)
    " let g:loaded_matchparen = 1
    let g:loaded_netrw = 1
    let g:loaded_netrwPlugin = 1
    let g:loaded_netrwFileHandlers = 1
    let g:loaded_netrwSettings = 1
    let g:loaded_rrhelper = 1
    let g:loaded_ruby_provider = 1
    let g:loaded_node_provider = 1
    let g:loaded_shada_plugin = 1
    let g:loaded_spellfile_plugin  = 1
    let g:loaded_tar = 1
    let g:loaded_tarPlugin = 1
    let g:loaded_tutor_mode_plugin = 1
    let g:loaded_2html_plugin = 1
    let g:loaded_vimball = 1
    let g:loaded_vimballPlugin = 1
    let g:loaded_zip = 1
    let g:loaded_zipPlugin = 1
" }

" wintabs {
    " let g:wintabs_display = [ 'tabline', 'statusline' ]
    " let g:wintabs_autoclose = 0
" }

" vim-buftabline {
    let g:buftabline_indicators = 1
" }

" completion-nvim {
    " possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
    let g:completion_enable_snippet = 'UltiSnips'

lua << EOF
    require'lspconfig'.pyls.setup {
        on_attach = require'completion'.on_attach
    }
    require'lspconfig'.clangd.setup {
        cmd = { "clangd", "--background-index" },
        on_attach = require'completion'.on_attach
    }
    require'lspconfig'.bashls.setup {
        on_attach = require'completion'.on_attach
    }
EOF
" }

" nvim-treesitter {
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "python", "bash" },
        highlight = {
            enable = true,
        },
    }
EOF
" }

" vim-lastplace {
    let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
    let g:lastplace_ignore_buftype = "quickfix,nofile,help"
    let g:lastplace_open_folds = 1
" }

" vim-hexokinase {
    let g:Hexokinase_highlighters = ['virtual']
    let g:Hexokinase_virtualText = '•••'
    " let g:Hexokinase_virtualText = '■■■'

    " To make it almost live
    " This may cause some lag if there are a lot of colours in the file
    " let g:Hexokinase_refreshEvents = ['TextChanged', 'TextChangedI']
    let g:Hexokinase_ftAutoload = ['xdefaults', 'css']
    let g:Hexokinase_optInPatterns = [
                \ 'full_hex',
                \ 'rgb',
                \ 'rgba'
                \ ]
" }

" vim-xray {
    " let g:xray_enable = 1
    " let g:xray_refresh_interval = 100
    " let g:xray_force_redraw = 1
" }

" vim-visual-multi {
    " let g:VM_default_mappings = 0
    " let g:VM_maps = {}
    " let g:VM_maps["Select h"]           = '<C-Left>'        " start selecting right
    " let g:VM_maps["Select l"]           = '<C-Right>'       " start selecting left
    " let g:VM_maps["Select Cursor Up"]   = '<C-Up>'          " start selecting up
    " let g:VM_maps["Select Cursor Down"] = '<C-Down>'        " start selecting down
" }


" vimade {
    " let g:vimade = {}
    " let g:vimade.normalid = ''
    " let g:vimade.basefg = ''
    " let g:vimade.basebg = ''
    " let g:vimade.fadelevel = 0.4
    " let g:vimade.colbufsize = 30
    " let g:vimade.rowbufsize = 30
    " let g:vimade.checkinterval = 32
" }

" fzf.vim {
    set rtp+=$HOME/.fzf

    let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS." --no-border"

    nmap <C-o> :Files<CR>
    nmap <C-p> :History<CR>

    nmap <A-r> :BTags<CR>
    nmap <A-S-r> :Tags<CR>

    nmap <A-f> :Rg<CR>
    nmap <A-s> :Snippets<CR>

    " This is the default extra key bindings
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }

    let g:fzf_preview_window = 'right:50%'

    " Required:
    " - width [float range [0 ~ 1]]
    " - height [float range [0 ~ 1]]
    "
    " Optional:
    " - xoffset [float default 0.5 range [0 ~ 1]]
    " - yoffset [float default 0.5 range [0 ~ 1]]
    " - highlight [string default 'Comment']: Highlight group for border
    " - border [string default 'rounded']: Border style
    "   - 'rounded' / 'sharp' / 'horizontal' / 'vertical' / 'top' / 'bottom' / 'left' / 'right'
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' } }

    " Customize fzf colors to match your color scheme
    " let g:fzf_colors =
    " \ {
    " \ 'fg':      ['fg', 'Black'],
    " \ 'bg':      ['bg', 'Normal'],
    " \ 'hl':      ['fg', 'Label'],
    " \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    " \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    " \ 'hl+':     ['fg', 'Statement'],
    " \ 'info':    ['fg', 'PreProc'],
    " \ 'border':  ['fg', 'Ignore'],
    " \ 'prompt':  ['fg', 'Conditional'],
    " \ 'pointer': ['fg', 'Exception'],
    " \ 'marker':  ['fg', 'Keyword'],
    " \ 'spinner': ['fg', 'Label'],
    " \ 'header':  ['fg', 'Comment']
    " \ }

    " Enable per-command history.
    " CTRL-N and CTRL-P will be automatically bound to next-history and
    " previous-history instead of down and up. If you don't like the change,
    " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
    let g:fzf_history_dir = '$HOME/.local/share/fzf-history'

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--format="%Cgreen[%h]%Creset %C(cyan)%an%Creset %C(yellow)%d%Creset - %s"'

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags'

    let g:fzf_nvim_statusline = 0 " disable statusline overwriting

    command! -bang -nargs=* Rga
    \ call fzf#vim#grep(
    \   'rg --column --color=always --hidden --no-heading '.shellescape(<q-args>), {'options': ['--tiebreak=end', '--delimiter=:', '--nth=3']},
    \   fzf#vim#with_preview(), <bang>0)

    " command! LS call fzf#run(fzf#wrap({'source': '__fzf_find'}))

    " Hide statusline of terminal buffer
    " autocmd! FileType fzf
    " autocmd  FileType fzf set laststatus=0 noshowmode noruler
    "     \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    " Add statusline of fzf
    function! s:fzf_statusline()
        highlight fzf_green ctermfg=2 ctermbg=0
        setlocal statusline=%#fzf_green#\ >>>\ fzf
    endfunction

    autocmd! User FzfStatusLine call <SID>fzf_statusline()
" }


" vim-gitgutter {
    if exists('&signcolumn')
        set signcolumn=yes
    else
        let g:gitgutter_sign_column_always = 1
    endif
    let g:gitgutter_max_signs = 300
    let g:gitgutter_map_keys = 0

    let g:gitgutter_sign_added = '•'
    let g:gitgutter_sign_modified = '•'
    let g:gitgutter_sign_removed = '•'
    let g:gitgutter_sign_modified_removed = '•'
    let g:gitgutter_sign_removed_first_line = '•'

    " nmap <Leader>gn <Plug>GitGutterNextHunk
    " nmap <Leader>gN <Plug>GitGutterPrevHunk
    " nmap <Leader>gu <Plug>GitGutterUndoHunk
    " nmap <Leader>gp <Plug>GitGutterPreviewHunk
" }


" lightline-bufferline {
    " let g:lightline#bufferline#show_number = 1
    " let g:lightline#bufferline#shorten_path = 1
    " let g:lightline#bufferline#unnamed  = '[No Name]'

    " let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
    " let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
    " let g:lightline.component_type = {'buffers': 'tabsel'}
" }


" lightline.vim {
    " let g:lightline = {
    " \   'colorscheme': 'nord',
    " \   'active': {
    " \     'left':[ [ 'mode', 'paste' ],
    " \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    " \     ]
    " \   },
	    " \   'component': {
	    " \     'lineinfo': ' %3l:%-2v',
	    " \   },
    " \   'component_function': {
    " \     'gitbranch': 'fugitive#head',
    " \   }
    " \ }
    " let g:lightline.separator = {
	    " \   'left': '', 'right': ''
    " \}
    " let g:lightline.subseparator = {
	    " \   'left': '', 'right': ''
    " \}
" }

" Airline {
    " let g:airline_extensions = ['branch', 'tabline', 'whitespace', 'ycm']

    " let g:airline#extensions#hunks#enabled = 0
    " let g:airline#extensions#wordcount#enabled = 0

    " let g:airline#extensions#tabline#formatter = 'unique_tail'
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#show_tabs = 1
    " let g:airline#extensions#tabline#show_splits = 0
    " let g:airline#extensions#tabline#show_buffers = 1
    " let g:airline#extensions#tabline#buffer_idx_mode = 1
    " let g:airline#extensions#tabline#buffer_nr_show = 0
    " let g:airline#extensions#tabline#ignore_bufadd_pat =
    "     \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

    " " let g:airline#extensions#tabline#fnamemod = ':t'
    " let g:airline#extensions#tabline#left_sep = ''
    " let g:airline#extensions#tabline#left_alt_sep = ''
    " let g:airline#extensions#tabline#right_sep = ''
    " let g:airline#extensions#tabline#right_alt_sep = ''

    " " resolve <tab> /* */ mixed-indent
    " let g:airline#extensions#whitespace#mixed_indent_algo = 1

    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''
    " let g:airline_theme= 'nord'

    " let g:airline_skip_empty_sections = 1

    " Activate powerline (Make sure to have a patched fond)
    " let g:airline_powerline_fonts = 1

    " if !exists('g:airline_symbols')
    "   let g:airline_symbols = {}
    " endif

    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'

    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''
    " let g:airline_symbols.branch = ''
    " let g:airline_symbols.readonly = ''
    " let g:airline_symbols.linenr = ''
" }

" deoplete-clang {
    " let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-3.9/lib/libclang-3.9.so.1"
" }


" deoplete {
    " let g:deoplete#enable_at_startup = 1
    " let g:deoplete#enable_ignore_case = 1
    " let g:deoplete#max_list = 50
    " let g:deoplete#auto_complete_delay = 20
    " let g:deoplete#auto_refresh_delay = 20

    " " " Let <Tab>/<s-Tab> also do completion
    " inoremap <silent><expr> <Tab>
    "   \ pumvisible() ? "\<C-n>" :
    "   \ deoplete#mappings#manual_complete()

    " inoremap <silent><expr> <s-Tab>
    "   \ pumvisible() ? "\<C-p>" :
    "   \ deoplete#mappings#manual_complete()

    " Do not miss snippets with short (single or double char) names from
    " deoplete completion list
    " call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

    " Close the documentation window when completion is done
    " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " set omnifunc=syntaxcomplete#Complete
" }


" nvim-completion-manager' {
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }


" vim-move {
    nmap <C-Up> <Plug>MoveLineUp
    nmap <C-Down> <Plug>MoveLineDown

    vmap <C-Up> <Plug>MoveBlockUp
    vmap <C-Down> <Plug>MoveBlockDown
" }


" NERDTree {
    " let g:NERDTreeMinimalUI = 1
    let g:NERDTreeWinSize = 25
    let g:NERDTreeChDirMode = 2
    let g:NERDTreeCascadeOpenSingleChildDir = 1
    let g:NERDTreeCascadeSingleChildDir = 0
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeRespectWildIgnore = 0
    let g:NERDTreeAutoDeleteBuffer = 0
    let g:NERDTreeQuitOnOpen = 0
    let g:NERDTreeHijackNetrw = 1
    let NERDTreeIgnore = [
        \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
        \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$'
        \ ]
" }


" vim-mundo {
    let g:mundo_width = 50
    let g:mundo_preview_height = 30
    let g:mundo_right = 1
    let g:mundo_auto_preview_delay = 0
    nnoremap <F5> :MundoToggle<CR>
" }


" is.vim {
    " map /  <Plug>(is-forward)
    " map ?  <Plug>(is-backward)
    " cmap <tab> <Plug>(is-scroll-f)
    " cmap <s-tab> <Plug>(is-scroll-b)

    " * maps the entire word only (e.g 'map')
    " g* maps the word that maybe is contained in another words
    "   -> e.g 'map' also in 'nmap'
    " map n  <Plug>(is-n)
    " map N  <Plug>(is-nohl-N)
    " map *  <Plug>(is-nohl-*)
    " map #  <Plug>(is-nohl-#)
    " map g* <Plug>(is-nohl-g*)
    " map g# <Plug>(is-nohl-g#)
    " let g:is#do_default_mappings = 0
" }


" incsearch.vim {
    " map /  <Plug>(incsearch-forward)
    " map ?  <Plug>(incsearch-backward)

    " set hlsearch
    " let g:incsearch#auto_nohlsearch = 1

    " * maps the entire word only (e.g 'map')
    " g* maps the word that maybe is contained in another words
    "   -> e.g 'map' also in 'nmap'
    " map n  <Plug>(incsearch-nohl-n)
    " map N  <Plug>(incsearch-nohl-N)
    " map *  <Plug>(incsearch-nohl-*)
    " map #  <Plug>(incsearch-nohl-#)
    " map g* <Plug>(incsearch-nohl-g*)
    " map g# <Plug>(incsearch-nohl-g#)

    " map /  <Plug>(incsearch-forward)
    " nnoremap <CR> :nohlsearch<CR><CR>
" }


" ultisnips {
    " UltiSnips folder is reserved for Ultisnips
    " snippets folder is reserved for snipMate

    " Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger = "<c-j>"
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

    " Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    " let g:UltiSnipsExpandTrigger="<TAB>"
    " let g:UltiSnipsJumpForwardTrigger="<TAB>"
    " let g:UltiSnipsListSnippets="<F4>"
    " let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

    " If you want :UltiSnipsEdit to split your window.
    " let g:UltiSnipsEditSplit="vertical"
" }

" YouCompleteMe {
    " let g:ycm_show_diagnostics_ui = 0
    " let g:ycm_server_python_interpreter = "/usr/bin/python2"
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    " let g:ycm_echo_current_diagnostics = 0
    " let g:ycm_enable_diagnostic_highlighting = 0
    " let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_confirm_extra_conf = 0
    " let g:ycm_auto_trigger = 1
    let g:ycm_keep_logfiles = 0
    " let g:ycm_cache_omnifunc = 0
    " let g:ycm_goto_buffer_command = 'new-or-existing-tab'
    " let g:ycm_open_loclist_on_ycm_diags = 0
    " let g:ycm_min_num_of_chars_for_completion = 3
    let g:ycm_max_num_candidates = 10

    let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']

    " Enable markdown support
    let g:ycm_filetype_blacklist = {
                \ 'notes': 1,
                \ 'markdown': 0,
                \ 'unite': 1,
                \ 'tagbar': 1,
                \ 'pandoc': 1,
                \ 'qf': 1,
                \ 'vimwiki': 1,
                \ 'text': 1,
                \ 'infolog': 1,
                \ 'mail': 1
                \ }
" }

" echodoc {
    " let g:echodoc_enable_at_startup = 1
" }

" vim-better-whitespace {
    let g:better_whitespace_guicolor='#BF616A'
" }

" startify {
    " Once in Startify set flgas to :
    "   b to open in a new buffer
    "   s to open in a horizontal split
    "   v to open in a vertical split
    "   t to open in a tab
    let g:startify_padding_left = 5

    let g:startify_custom_header = [
        \'',
        \'',
        \'      $$\      $$\           $$\',
        \'      $$ | $\  $$ |          $$ |',
        \'      $$ |$$$\ $$ | $$$$$$\  $$ | $$$$$$$\  $$$$$$\  $$$$$$\$$$$\   $$$$$$\',
        \'      $$ $$ $$\$$ |$$  __$$\ $$ |$$  _____|$$  __$$\ $$  _$$  _$$\ $$  __$$\',
        \'      $$$$  _$$$$ |$$$$$$$$ |$$ |$$ /      $$ /  $$ |$$ / $$ / $$ |$$$$$$$$ |',
        \'      $$$  / \$$$ |$$   ____|$$ |$$ |      $$ |  $$ |$$ | $$ | $$ |$$   ____|',
        \'      $$  /   \$$ |\$$$$$$$\ $$ |\$$$$$$$\ \$$$$$$  |$$ | $$ | $$ |\$$$$$$$\',
        \'      \__/     \__| \_______|\__| \_______| \______/ \__| \__| \__| \_______|',
        \'',
        \ ]

    let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
        \ 'bundle/.*/doc',
        \ ]

    let g:startify_bookmarks = [
        \ { 'c': '~/.dotfiles/nvim/.config/nvim/init.vim' },
        \ { 'f': '~/.dotfiles/nvim/.config/nvim/config/functions.vim' },
        \ { 'm': '~/.dotfiles/nvim/.config/nvim/config/mapping.vim' },
        \ { 'p': '~/.dotfiles/nvim/.config/nvim/config/plugins.vim' },
        \ { 's': '~/.dotfiles/nvim/.config/nvim/config/plugins_settings.vim' },
        \ ]

    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

    let g:startify_commands = [
        \ {'U': ['update plugins', 'PlugUpdate']},
        \ {'I': ['install plugins', 'PlugInstall']},
        \ {'C': ['check health', 'checkhealth']},
        \ ]

    let g:startify_change_to_dir = 1
    let g:startify_change_to_vcs_root = 1

    " Show <empty buffer> and <quit>
    let g:startify_enable_special = 1

    let g:startify_files_number = 5
    let g:startify_update_oldfiles = 1

    " TODO: correctly handles sessions
    " let g:startify_session_dir = '~/.vim/session'
    " let g:startify_session_autoload  = 0
    " let g:startify_session_persistence = 0
" }


" defx.nvim {
    call defx#custom#option('_', {
        \ 'columns': 'mark:indent:git:icons:filename:type',
        \ 'winwidth': 30,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'show_ignored_files': 0,
	    \ 'ignored_files':
	    \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	    \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
	    \ })

    call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

    autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
        " Define mappings
	    nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
	    nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
	    nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
        nnoremap <silent><buffer><expr> c defx#do_action('copy')
        nnoremap <silent><buffer><expr> m defx#do_action('move')
        nnoremap <silent><buffer><expr> p defx#do_action('paste')
        nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
        nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
        nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
        nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
        nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
        nnoremap <silent><buffer><expr> N defx#do_action('new_file')
        nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
        nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:filename:type:size:time')
        nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
        nnoremap <silent><buffer><expr> d defx#do_action('remove')
        nnoremap <silent><buffer><expr> r defx#do_action('rename')
        nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
        nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
        nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
        nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
        nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
        nnoremap <silent><buffer><expr> q defx#do_action('quit')
        nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
        nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')

        " moving around folder
        nnoremap <silent><buffer><expr> <left> defx#do_action('cd', ['..'])
        " if cyclate over again when at bottom
        " nnoremap <silent><buffer><expr> <down> line('.') == line('$') ? 'gg' : 'j'
        " nnoremap <silent><buffer><expr> <up> line('.') == 1 ? 'G' : 'k'
        nnoremap <silent><buffer><expr> <right> defx#do_action('drop')

        nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
        nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
        " Mouse
        nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('open_or_close_tree')
        nnoremap <silent><buffer><expr> <3-LeftMouse> defx#do_action('drop')
        nnoremap <silent><buffer><expr> <RightMouse> defx#do_action('cd', ['..'])
    endfunction
" }

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop', 'quit'])
endfunction

" defx-git {
    let g:defx_git#indicators = {
      \ 'Modified'  : '•',
      \ 'Staged'    : '•',
      \ 'Untracked' : '•',
      \ 'Renamed'   : '•',
      \ 'Unmerged'  : '•',
      \ 'Ignored'   : '•',
      \ 'Deleted'   : '•',
      \ 'Unknown'   : '•'
      \ }

    let g:defx_git#column_length = 1
    let g:defx_git#show_ignored = 0
    let g:defx_git#raw_mode = 0

    hi Defx_git_Untracked guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    hi Defx_git_Ignored guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    hi Defx_git_Unknown guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    hi Defx_git_Renamed ctermfg=2 guifg=#ff0000
    hi Defx_git_Modified ctermfg=2 guifg=#ff0000
    hi Defx_git_Unmerged ctermfg=2 guifg=#ff0000
    hi Defx_git_Deleted ctermfg=2 guifg=#ff0000
    hi Defx_git_Staged ctermfg=2 guifg=#ff0000
" }


" defx-icons {
    let g:defx_icons_enable_syntax_highlight = 1
    let g:defx_icons_column_length = 2
    let g:defx_icons_directory_icon = ''
    let g:defx_icons_mark_icon = '*'
    let g:defx_icons_parent_icon = ''
    let g:defx_icons_default_icon = ''
    let g:defx_icons_directory_symlink_icon = ''
    " Options below are applicable only when using "tree" feature
    let g:defx_icons_root_opened_tree_icon = ''
    let g:defx_icons_nested_opened_tree_icon = ''
    let g:defx_icons_nested_closed_tree_icon = ''
" }
