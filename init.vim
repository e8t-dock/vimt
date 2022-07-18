" Playground

"" setenv VIM $HQ_VIM_HOME
call setenv('VIM', $HQ_VIM_HOME)

set nu

set nocp
set nobk

set dir=$VIM/tmp

map <leader>ec :tabe $VIM/init.vim

set autochdir

filetype plugin on

set rtp+=$VIM/runtime
set pp+=$VIM/runtime

" noremap <c-r> :!dotnet fsi %<cr>

exec "so " . $VIM . "/main.vim"

set bg=dark
colorscheme lucius
