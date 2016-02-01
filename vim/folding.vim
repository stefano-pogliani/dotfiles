"Code folding configuration."
function ConfigureFolding()
  "Get file type or extension."
  let type = &filetype
  if type == ''
    let type = fnamemodify(bufname("%"), ":e")
  endif

  "Set the encoding based on that."
  if     type == 'json'   | set foldmethod=indent
  elseif type == 'python' | set foldmethod=indent
  else                    | set foldmethod=syntax
  endif
endfunction

autocmd FileType * call ConfigureFolding()
set foldlevelstart=20


"Wait for the file type to be loaded before using it."
let g:file_based_main_run = 0
function FileBasedMain()
  if g:file_based_main_run
    return
  endif

  "Enable NERDTree only if not in git commit mode"
  if &filetype != 'gitcommit'
    call ConfigureNerdTree()
  endif

  let g:file_based_main_run = 1
endfunction
autocmd BufWinEnter * call FileBasedMain()
