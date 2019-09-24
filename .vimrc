set nocompatible              " be iMproved, required
filetype off                  " required

set laststatus=0

" set the runtime path to include Vundle and initialie
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'dikiaap/minimalist'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'slashmili/alchemist.vim'
"Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'mrk21/yaml-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mileszs/ack.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'christoomey/vim-conflicted'
Plugin 'mhinz/vim-mix-format'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-python/python-syntax'
"Plugin 'ajh17/VimCompletesMe'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'



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

"Trackpad Scrolling
set mouse=a

" MultiCursor setting of values
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim

let mapleader = ","
nmap <leader>ne :NERDTree<cr>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

set number
execute pathogen#infect()

set t_Co=256
syntax on
colorscheme minimalist

" Indent Highlighting Variables
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 50
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

"let g:airline_theme='minimalist'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

let g:vim_pbcopy_local_cmd = "pbcopy"

set encoding=utf-8

" 2 space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab

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

" Mix Compile
command! MC ! mix compile

" Mix Format on save
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

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
    "\ set textwidth=79 |
    \ set fileformat=unix

