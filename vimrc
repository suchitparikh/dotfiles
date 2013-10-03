set guifont=Consolas:h14
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set expandtab
set mouse=a
set ttymouse=xterm2
set number
set smartindent
syntax on

au FileType php  setlocal keywordprg=pman
au FileType sass setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType go   setlocal nowrap textwidth=0
au FileType json setlocal foldmethod=indent
au FileType perl setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Trim whitespace from the end of all lines
command Trim %s/\s\+$//

"" Convert tabs to 4 spaces
command Detab %s/\t/    /g

" Alias W to also be "save" (fat fingers)
command W w
