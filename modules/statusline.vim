set laststatus=2
set statusline=%2*\ \%{StatuslineMode()}\ \%#LGrn2LMag#
set statusline+=%1*\ \%f\ \%#LMag2Grey#
set statusline+=%0*%=%m%h%r
set statusline+=%#LGrn2Grey#%3*\ \%{b:gitbranch}\ \%3*
set statusline+=%#LBlu2LGrn#%5*\ \%l/%L\ \%5*
set statusline+=%#LMag2LBlu#%1*\ \%y\ \%1*

" Transitions
hi LMag2LBlu ctermbg=lightblue ctermfg=lightmagenta guibg=#61afef guifg=#c678dd
hi LGrn2LMag ctermbg=lightmagenta ctermfg=lightgreen guibg=#c678dd guifg=#98c379
hi LMag2Grey ctermbg=grey ctermfg=lightmagenta guibg=#2c323c guifg=#c678dd
hi LGrn2Grey ctermbg=grey ctermfg=lightgreen guibg=#2c323c guifg=#98c379
hi LBlu2LGrn ctermbg=lightgreen ctermfg=lightblue guibg=#98c379 guifg=#61afef

" Colors
hi User1 ctermbg=lightmagenta ctermfg=black guibg=#c678dd guifg=black
hi User2 ctermbg=lightgreen ctermfg=black guibg=#98c379 guifg=black
hi User3 ctermbg=lightgreen ctermfg=black guibg=#98c379 guifg=black
hi User4 ctermbg=lightblue ctermfg=black guibg=#61afef guifg=black
hi User5 ctermbg=lightblue ctermfg=black guibg=#61afef guifg=black

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==#"v"
    return "VISUAL"
  elseif l:mode==#"V"
    return "VISUAL-L"
  elseif l:mode==#"\<C-V>"
    return "VISUAL-B"
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
        let b:gitbranch=" ".substitute(l:gitrevparse, '\n', '', 'g').""
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
