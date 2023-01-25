set nocompatible
set relativenumber
set number
syntax on
set cc=80
set mouse=v
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set termguicolors
filetype plugin on
filetype plugin indent on

autocmd FileType javascript setlocal softtabstop=4

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'itchyny/lightline.vim'

call plug#end()

colorscheme nightfly

let g:lightline = { 'colorscheme': 'nightfly' }
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let mapleader = " "

nnoremap <C-p> :FZF <CR>
nnoremap <C-J> <C-w><C-s><C-w>j:resize 20<CR>:terminal<CR>A

