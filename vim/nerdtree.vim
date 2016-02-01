"NERDTree integration."
function NerdTreeIsOpen()
  if (exists("t:NERDTreeBufName"))
    return bufwinnr(t:NERDTreeBufName) != -1
  endif
  return 0
endfunction


function NerdTreeShow()
  if (NerdTreeIsOpen())
    return
  endif

  if exists(":NERDTree")
    NERDTree
    wincmd p
  endif
endfunction

function NerdTreeSync()
  if exists(":NERDTree")
    silent NERDTreeMirror
  endif
endfunction

function NerdTreeQuitLast()
  if (winnr("$") == 1 && exists("t:NERDTreeBufName"))
    if (bufwinnr(t:NERDTreeBufName) != -1)
      quit
    endif
  endif
endfunction


"Register with events."
function ConfigureNerdTree()
  autocmd VimEnter *    call NerdTreeShow()
  autocmd BufWinEnter * call NerdTreeSync()
  autocmd BufEnter *    call NerdTreeQuitLast()
endfunction
