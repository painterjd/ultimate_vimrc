colorscheme desert

"""""""""""""
" tab stuff "
"""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set autoindent

" Enable auto-indent based on file type "
filetype indent on

set number
set laststatus=2
set hlsearch
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Set custom wsiwft widths for python

if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4
autocmd BufWrite *.py :call DeleteTrailingWS()

" Set word-wrap options for text files
autocmd BufRead,BufNewFile *.txt,*.TXT set wrap linebreak nolist textwidth=0 wrapmargin=0 spell 
hi CursorLine ctermbg=yellow cterm=none

" re-map alt+[j|k] to move lines up and down "
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
