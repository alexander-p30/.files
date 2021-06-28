fun! OpenNeotermInNewTabAndFocus(option)
  if a:option == 'tn'
    TestNearest
  elseif a:option == 'tf'
    TestFile
  elseif a:option == 'ts'
    TestSuite
  elseif a:option == 'tl'
    TestLast
  endif

  tabnext
endfun

fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
  if choice == 1 | call delete(expand('%:p')) | q! | endif
endfun

fun! ProfileSession()
  profile start profile.log
  profile func *
  profile file *
endfun

fun! EndSessionProfiling()
  profile pause
  noautocmd qall!
endfun
