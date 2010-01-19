set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4 " makes the spaces feel like real tabs

set wrapscan " search wraps at eof
set hlsearch " highlight all search results
set ignorecase

set number
set numberwidth=4

set wrap
set lbr "break longs lines
set textwidth=79

set mouse=a

set clipboard+=unnamed  " yank and copy to X clipboard

map ; :

syntax on
colorscheme ron
highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+$/

set splitbelow "new windows opened below current rather than above

" write and run python (f5) and perl (f6)
"map <buffer> <F5> :w<CR>:!python %<CR>
"map <buffer> <F6> :w<CR>:!perl %<CR>
"map <buffer> <F7> :w<CR>:!markdown % > %.htm<CR>
"map <buffer> <F8> :w<CR>:!gcc  -Wall -ansi -pedantic % && ./a.out<CR>

autocmd FileType python nnoremap <F5> :w<CR>:!python %:p<CR>
autocmd FileType perl   nnoremap <F5> :w<CR>:!perl %:p<CR>
autocmd FileType c      nnoremap <F5> :w<CR>:!gcc  -Wall -ansi -pedantic %:p && ./a.out<CR>
autocmd FileType mkd    nnoremap <F5> :w<CR>:!markdown % > %.htm<CR>

" quick window movement
map <a-w>  <c-w>
map <a-l> <c-w>l
map <a-k> <c-w>k
map <a-j> <c-w>j
map <a-h> <c-w>h
imap <a-l> <esc><c-w>li
imap <a-k> <esc><c-w>ki
imap <a-j> <esc><c-w>ji
imap <a-h> <esc><c-w>hi

