""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NVIM Mapping                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap Ctrl-s to save and exit insert
noremap <c-s> :update<cr>
vnoremap <c-s> <c-c>:update<cr>
inoremap <c-s> <c-o>:update<cr><esc>

" Move between buffers
noremap <a-right> :bn<cr>
noremap <a-left> :bp<cr>

" Move between splits
noremap <c-a-right> :wincmd l<cr>
noremap <c-a-left> :wincmd h<cr>
noremap <c-a-down> :wincmd j<cr>
noremap <c-a-up> :wincmd k<cr>

" Make sure to escape everything, remapping ESC in vim
" creates A B C D when using arrows in insert mode
if has("nvim")
	inoremap <esc> <esc><esc>
endif

nnoremap <silent> <esc><esc> :<c-u>nohlsearch<CR>

" Remap Ctrl-w to close/destroy buffer using vim-sayonara
noremap <nowait> <c-w> :Sayonara<cr>

" Duplicate line
map <a-d> <Plug>Duplicate

" Select all text
map <c-a> <esc>ggVG<CR>

" F3: Toggle list (display unprintable characters)
nnoremap <silent> <F3> :set list!<CR>

" Do not enter Ex mode
nnoremap Q <nop>

