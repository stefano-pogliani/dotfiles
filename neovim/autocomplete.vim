" Configure auto-complete to open on Ctrl+Space while in insert mode.
" Use the basic popup filled in based on `complete` (activated with C-n).
" For ideas on complete vs omni-complete: https://stackoverflow.com/a/6942640
inoremap <silent> <C-Space> <C-n>
set complete-=t  " Remove tag complete but keep other sources.


" Setup dictionary as part of the complete menu.
set dictionary+=/usr/share/myspell/en_GB.dic
set dictionary+=/usr/share/myspell/it_IT.dic
set complete+=k  " Add complete from dictionary.


" Configure spell checking based on the above dictionary.
map  <silent> <F2> :setlocal spell! spelllang=en_gb<CR>
map  <silent> <F3> z=
imap <silent> <F2> <Esc><F2>i
imap <silent> <F3> <Esc><F3>
command SpellCheck execute "setlocal spell spelllang=en_gb"
command Nospell    execute "set nospell"
