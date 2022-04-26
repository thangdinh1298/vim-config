"space and tab
"numbeG of visual spaces per tab"
set tabstop=4

"number of spaces when editing
set softtabstop=4

"size of indent
set shiftwidth=4

"highlight
set cursorline

"ui config

set number
set relativenumber

"Allow backspaces in insert mode
set backspace=indent,eol,start

"seaching
set incsearch
set hlsearch
set expandtab
"Set modifiable
set ma
"turn off hightlight
"map <i> :set nohlsearch<cr>
nnoremap <leader><space> :nohlsearch<cr>

"stop highlighting when entering insert mode
autocmd InsertEnter * let @/ = ""

" Set gruvbox
autocmd vimenter * nested colorscheme gruvbox " for ++nested for newer version of vim


" Windows movement keymap
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-i> <C-w>k
noremap <C-l> <C-w>l

"Set paste off for braces completion
set nopaste
"Automatic braces completion
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Alt i/k for inserting newline above and below the current line without leaving normal
" mode
nnoremap <silent><A-o> :set paste<CR>o<Esc>:set nopaste<CR>
nnoremap <silent><A-O> :set paste<CR>O<Esc>:set nopaste<CR>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Ag<cr>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hotwatermorning/auto-git-diff'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
call plug#end()

"Termdebug
let g:termdebugger='/home/thangdd/usr/local/bin/gdb'
let g:termdebug_wide=1
