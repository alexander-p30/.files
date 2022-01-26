fun! TestInNeoterm(option)
  if a:option == 'tn'
    TestNearest
  elseif a:option == 'tf'
    TestFile
  elseif a:option == 'ts'
    TestSuite
  elseif a:option == 'tl'
    TestLast
  endif
  Topen
endfun

fun! LintInNeoterm()
  T MIX_ENV=test mix format && mix credo --strict && mix dialyzer
  Topen
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

fun! SetBranchUpstream()
  let setUpstreamCmd = ":Git push --set-upstream origin " . system("git rev-parse --abbrev-ref HEAD")
  execute feedkeys(setUpstreamCmd)
endfun
