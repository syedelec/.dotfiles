""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NVIM FUNCTIONS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"  Clean and Safe buffer close  "
"""""""""""""""""""""""""""""""""

" use plugin vim-sayonara instead of function


""""""""""""""""""""""""""""""""""""""
"  Reopen file at previous position  "
""""""""""""""""""""""""""""""""""""""

" use plugin vim-lastplace instead of function


""""""""""""""""""""""""""""""
"  Duplicate line/selection  "
""""""""""""""""""""""""""""""

function! s:DuplicateVisualSelection()
    let existing_register_value = @0
    execute 'normal! gvy`>p'
    let @0 = existing_register_value
endfunction

nnoremap <silent> <Plug>Duplicate :t.<CR>
xnoremap <silent> <Plug>Duplicate :<C-u>call <SID>DuplicateVisualSelection()<CR>


""""""""""""""""""""""""""""""""""""""""
"  Write content of file in sudo mode  "
""""""""""""""""""""""""""""""""""""""""

" Function from tpope/eunuch
" function! s:SudoWriteCmd() abort
"   execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee VISUAL=tee sudo -e "%" >/dev/null'
"   let &modified = v:shell_error
" endfunction

" nnoremap <silent> <Plug>SudoWrite :<c-u>call <sid>SudoWriteCmd()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""
"  Set correct spaces/tab indentation on command  "
"""""""""""""""""""""""""""""""""""""""""""""""""""

function! _set_spacing(...)
    execute "set tabstop=".a:1." softtabstop=".a:1" shiftwidth=".a:1
endfunction

function! _convert_to_tab(...)
    if a:0 > 0
        call _set_spacing(a:1)
    endif
    set noexpandtab
    execute "%retab!"
endfunction

function! _convert_to_space(...)
    if a:0 > 0
        call _set_spacing(a:1)
    endif
    set expandtab
    execute "%retab!"
endfunction

command! -bang -nargs=* UseTab call _convert_to_tab(<f-args>)
command! -bang -nargs=* UseSpace call _convert_to_space(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""
"  Toggles between the current window and tab  "
""""""""""""""""""""""""""""""""""""""""""""""""

function! _window_toggle_tab()
  if winnr("$") > 1
  " There are more than one window in this tab
    if exists("b:maximized_window_id")
      call win_gotoid(b:maximized_window_id)
    else
      let b:origin_window_id = win_getid()
      tab sp
      let b:maximized_window_id = win_getid()
    endif
  else
  " This is the only window in this tab
    if exists("b:origin_window_id")
      let l:origin_window_id = b:origin_window_id
      tabclose
      call win_gotoid(l:origin_window_id)
      unlet b:maximized_window_id
      unlet b:origin_window_id
    endif
  endif
endfunction

command! ToggleOnly call _window_toggle_tab()

