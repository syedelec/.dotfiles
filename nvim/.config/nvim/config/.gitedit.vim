function! GitUser()
    let s:name = substitute(system("git config --get user.name"), '\n', '', 'g')
    return s:name
endfunction

function! GitEmail()
    let s:email = substitute(system("git config --get user.email"), '\n', '', 'g')
    return substitute(s:email, '.com', '', 'g')
endfunction

function! GitOriginUrl()
    let s:origin = substitute(system("git config --get remote.origin.url"), '\n', '', 'g')
    return substitute(s:origin , 'git@github.com:', '','g')
endfunction

set statusline+=%1*%{GitUser()}
set statusline+=%=
set statusline+=%0*%{GitOriginUrl()}
set statusline+=%=
set statusline+=%1*%{GitEmail()}

hi StatusLine ctermbg=black
