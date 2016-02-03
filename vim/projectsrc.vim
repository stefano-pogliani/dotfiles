"Attempt to load per-project VimRc configurations."
function LoadProjectVimRc()
  if filereadable("project.vimrc")
    source project.vimrc
  endif
endfunction

autocmd VimEnter * call LoadProjectVimRc()
