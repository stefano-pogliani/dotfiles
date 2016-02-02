"Configure pane navigation."
nnoremap <silent> <A-Down>  :wincmd j<CR>
nnoremap <silent> <A-Left>  :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
nnoremap <silent> <A-Up>    :wincmd k<CR>

nnoremap <silent> <A-PageDown> 200:wincmd l<CR>
nnoremap <silent> <A-PageUp>   200:wincmd h<CR>


function SpoglianiMoveWindow(directon)
  call WindowSwap#EasyWindowSwap()
  exec "wincmd " . a:directon
  call WindowSwap#EasyWindowSwap()
endfunction

nnoremap <silent> <A-S-Down>  :call SpoglianiMoveWindow("j")<CR>
nnoremap <silent> <A-S-Left>  :call SpoglianiMoveWindow("h")<CR>
nnoremap <silent> <A-S-Right> :call SpoglianiMoveWindow("l")<CR>
nnoremap <silent> <A-S-Up>    :call SpoglianiMoveWindow("k")<CR>

nnoremap <silent> <C-S-Left>  :tabmove -1<CR>
nnoremap <silent> <C-S-Right> :tabmove +1<CR>

"Configure word jumping."
inoremap <silent> <C-Left>    <Esc><Right>bi
inoremap <silent> <C-Right>   <Esc><Right>wi
inoremap <silent> <C-S-Left>  <Esc><Right>Bi
inoremap <silent> <C-S-Right> <Esc><Right>Wi
