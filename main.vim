noremap q <nop>
noremap qq :q<cr>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Ctrl + S can cause issues in Unix terminals
" nnoremap <C-S> :update<cr>
" inoremap <C-S> <Esc>:update<cr>gi
nnoremap zz :update<cr>
inoremap zz <Esc>:update<cr>
inoremap zx <Esc>:update<cr>gi
" nnoremap zz <Esc>:CocCommand prettier.formatFile<cr><Esc>:update<cr>
" inoremap zz <Esc>:CocCommand prettier.formatFile<cr><Esc>:update<cr>
" inoremap zx <Esc>:CocCommand prettier.formatFile<cr><Esc>:update<cr>gi


let g:SimpylFold_docstring_preview=1

" proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" for fullstack
au BufNewFile,BufRead *.js,*.html,*.css
            \ set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2

" highlight space
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O

" airline

let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1

" Airline settings
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" " ale options
" let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
" let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
" let g:ale_list_window_size = 4
" let g:ale_sign_column_always = 0
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = '1'
" 
" " Options are in .pylintrc!
" highlight VertSplit ctermbg=253
" 
" let g:ale_sign_error = '‼'
" let g:ale_sign_warning = '∙'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = '0'
" let g:ale_lint_on_save = '1'
" nmap <silent> <C-M> <Plug>(ale_previous_wrap)
" nmap <silent> <C-m> <Plug>(ale_next_wrap)

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" " ncm2 settings
" let g:python3_host_prog = '/home/quantum/anaconda3/bin/python3'
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=menuone,noselect,noinsert
" set shortmess+=c
" inoremap <c-c> <ESC>
" " make it fast
" let ncm2#popup_delay = 5
" let ncm2#complete_length = [[1, 1]]
" " Use new fuzzy based matches
" let g:ncm2#matcher = 'substrfuzzy'

" Coc
let $NVIM_COC_HOME = $VIM . '/coc'
let g:coc_config_home = $VIM
let g:coc_data_home = $NVIM_COC_HOME
let g:coc_global_extensions = [
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver'
  \]

  " \ 'coc-tailwindcss',
  
" coc-snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" <tab>
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ CheckBackSpace() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

let g:coc_snippet_next = '<tab>'

" vimwiki
let g:vimwiki_list = [{'path': '~/Downloads/craft/vimwiki/wiki/', 'path_html': '~/Downloads/craft/vimwiki/html/'}]

autocmd BufRead,BufNewFile *.heex set filetype=html

" Event: autocmd FileType csharp 文件中 set ft=csharp
autocmd FileType,BufNewFile,BufRead,BufWinEnter,BufEnter *.cs setl et sw=2 sts=2 ts=2

" : is a command
augroup set ignorecase smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END
