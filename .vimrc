set nocompatible              " be iMproved, required
filetype off                  " required

" dont judge me
set mouse=a

set laststatus=0

" set the runtime path to include Vundle and initialie
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'dikiaap/minimalist'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mrk21/yaml-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ajh17/VimCompletesMe'

" 2020
Plugin 'svermeulen/vim-easyclip'
Plugin 'sheerun/vim-polyglot'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wikitopian/hardmode'

" 2021
Plugin 'pearofducks/ansible-vim'

" 2022
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'srcery-colors/srcery-vim'

" Python
Plugin 'psf/black'
Plugin 'hashivim/vim-terraform'
"Plugin 'tell-k/vim-autopep8'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " require"

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

set rtp+=/usr/local/opt/fzf

set backupdir=~/.tmp
set directory=~/.tmp

"Undoing
set undofile
set undodir=~/.vim/undodir
set undolevels=5000
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NerdTree show Hidden Files
let NERDTreeShowHidden=1

" clipboard
set clipboard=unnamed

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" quit NerdTree if its the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" OG's. My home. You need this
let mapleader = ","
nmap <leader>ne :NERDTree<cr>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

set number
"execute pathogen#infect()

set t_Co=256
syntax on
colorscheme srcery
colorscheme minimalist
let g:material_theme_style = 'default'

" Indent Highlighting Variables
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 50
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

let g:vim_pbcopy_local_cmd = "pbcopy"

set encoding=utf-8

" 2 space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Open folds by default
set nofoldenable

set hlsearch
"set ruler
set showmatch

" allow Delete key in VIM in insert mode
:set bs=2

set linebreak               " Break long lines by word, not char
set matchtime=2             " Tenths of second to hilight matching paren
set scrolloff=4             " Keep cursor away from this many chars top/bot
set shiftround              " Shift to certain columns, not just n spaces
set shortmess+=A            " Don't bother me when a swapfile exists

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL
command! O ! vim $(fzf)
command! PYTAB :%s/^I/    /

" Python Specific
let g:python_highlight_all = 1
let g:pymode_python = 'python3'
let g:syntastic_python_checkers = ['python3']
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']


"let g:pymode_python = 'python3' The first line ensures that the auto-complete window goes away when you’re done with it, and the second defines a shortcut for goto definition.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" PEP-8
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set fileformat=unix

" AutoRun Black on Write
"autocmd BufWritePre *.py execute ':Black'

" Vim Hardmode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Disable Arrow Keys
augroup SeriouslyNoInsertArrows
  autocmd!
  autocmd InsertEnter * inoremap <expr> <Up> pumvisible() ? "\<C-P>" : ""
  autocmd InsertEnter * inoremap <expr> <Down> pumvisible() ? "\<C-N>" : ""
augroup END

" AutoFormat Terraform Code
let g:terraform_fmt_on_save=1

" Auto PEP8 formatting
"let g:autopep8_on_save = 1

" Strip all trailing whitespace from files on save
autocmd BufWritePre * :%s/\s\+$//e

" Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible

" Add Python headers to files
autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\# -*- coding: utf-8 -*-\<nl>\<nl>\"|$
