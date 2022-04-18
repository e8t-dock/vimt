" Playgound

set nu

set nocp
set nobk
" set dir=$HQ/config/minivim/tmp
set dir=$HOME/Downloads/minivim/tmp

map <leader>ec :tabe $VIM/init.vim

set autochdir

filetype plugin on

set rtp+=$VIM/runtime
set pp+=$VIM/runtime

" noremap <c-r> :!dotnet fsi %<cr>

exec "so " . $DOWN . "/minivim/xubuntu.vim"

set bg=dark
colorscheme lucius
