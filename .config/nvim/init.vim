syntax on
set clipboard+=unnamedplus  " systm clipboard sync

set rtp +=~/.vim

call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'terryma/vim-multiple-cursors'
Plug 'mrk21/yaml-vim'

" 2021
"Plug 'pearofducks/ansible-vim'

" Python
"Plug 'psf/black'
Plug 'hashivim/vim-terraform'
"Plug 'davidhalter/jedi-vim'

" 2022
Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 2023
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 2024
Plug 'charlespascoe/vim-go-syntax'
call plug#end()

" set termguicolors
set number
colorscheme onedark

" Vim Jedi. Don't show autocompelte options after every dot
let g:jedi#popup_on_dot = 0
" Vim Jedi. Don't show parameters when hovering function
let g:jedi#show_call_signatures = "0"

" Super Tab
" Tab through completions from top to bottom
"let g:SuperTabDefaultCompletionType = "<c-n>"
" Use Vim Jedi Autocomplete results
let g:SuperTabDefaultCompletionType = "context"

" Python Specific
let g:python_highlight_all = 1
let g:pymode_python = 'python3'
let g:syntastic_python_checkers = ['python3']
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']

" PEP-8
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set fileformat=unix

" GoLang
au BufNewFile,BufRead *.go
  \ set tabstop=8 |
  \ set softtabstop=8 |
  \ set shiftwidth=8 |
  \ set expandtab |
  \ set fileformat=unix


" Strip all trailing whitespace from files on save
" autocmd BufWritePre * :%s/\s\+$//e

" Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible

" Add Python headers to files
autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\# -*- coding: utf-8 -*-\<nl>\<nl>\"|$

" AutoRun Black on Write
" autocmd BufWritePre *.py execute ':Black'

" AutoFormat Terraform Code
let g:terraform_fmt_on_save=1


" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set mouse=a
set ruler                       " Show the line and column numbers of the cursor.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" 2 space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" creates directories when trying to save files in directories that dont exist
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

let g:python3_host_prog = '/Users/briansmith/.asdf/shims/python3'

" Spell check some files
autocmd FileType md,markdown setlocal spell

" Remap d to be delete
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

let mapleader = ","
nmap <leader>ne :NERDTree<cr>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>

" use Ag with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_working_path_mode="r" " search from project root and not cwd
