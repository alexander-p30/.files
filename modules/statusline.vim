set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=%#LGrn2LMag#
set statusline+=
set statusline+=%1*
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=%#LMag2Grey#
set statusline+=
set statusline+=%0*
set statusline+=%=
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%#LGrn2Grey#
set statusline+=
set statusline+=%3*
set statusline+=%{b:gitbranch}
set statusline+=%#LBlu2LGrn#
set statusline+=
set statusline+=%4*
set statusline+=::
set statusline+=%5*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=%#LMag2LBlu#
set statusline+=
set statusline+=%1*
set statusline+=|
set statusline+=%y

" Transitions
hi LMag2LBlu ctermbg=lightblue ctermfg=lightmagenta guibg=lightblue guifg=lightmagenta
hi LGrn2LMag ctermbg=lightmagenta ctermfg=lightgreen guibg=lightmagenta guifg=lightgreen
hi LMag2Grey ctermbg=240 ctermfg=lightmagenta guibg=#2c323c guifg=lightmagenta
hi LGrn2Grey ctermbg=240 ctermfg=lightgreen guibg=#2c323c guifg=lightgreen
hi LBlu2LGrn ctermbg=lightgreen ctermfg=lightblue guibg=lightgreen guifg=lightblue

" Colors
hi User1 ctermbg=lightmagenta ctermfg=black guibg=lightmagenta guifg=black
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User3 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User4 ctermbg=lightblue ctermfg=black guibg=lightblue guifg=black
hi User5 ctermbg=lightblue ctermfg=darkmagenta guibg=lightblue guifg=darkmagenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
