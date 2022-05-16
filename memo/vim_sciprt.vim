function! s:tbsqlfmt() abort
  %s/\n/ /g
  call setqflist([])
  let cmd = get(g:, 'tbsqlfmt_program', 'sqlformat -r -k upper -o %s -')
  let tmpfile = ''
  if stridx(cmd, '%s') > -1
    let tmpfile = tempname()
    let cmd = substitute(cmd, '%s', tr(tmpfile, '\', '/'), 'g')
    let lines = system(cmd, iconv(join(getline(1, '$'), "\n"), &encoding, 'utf-8'))
    if v:shell_error != 0Í
      call delete(tmpfile)
      echoerr substitute(lines, '[\r\n]', ' ', 'g')
      return
    endif
    let lines = join(readfile(tmpfile), "\n")
    call delete(tmpfile)
  else
    let lines = system(cmd, iconv(join(getline(1, '$'), "\n"), &encoding, 'utf-8'))
    if v:shell_error != 0
      echoerr substitute(lines, '[\r\n]', ' ', 'g')
      return
    endif
  endif
  let pos = getcurpos()
  silent! %d _
  call setline(1, split(lines, "\n"))
  call setpos('.', pos)
endfunction

nnoremap <silent> <Plug>(tbsqlfmt) :<c-u>call <SID>tbsqlfmt()<cr>

command! -nargs=0 Tbfmt call <SID>tbsqlfmt()\