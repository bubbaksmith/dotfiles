set nocompatible              " be iMproved, required
filetype off                  " required

 set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'slashmili/alchemist.vim'
 Plugin 'tarekbecker/vim-yaml-formatter'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'nathanaelkane/vim-indent-guides'

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

 set encoding=utf-8
 set tabstop=2
 set shiftwidth=2
 set softtabstop=2
 set hlsearch
 set autoindent
 set ruler
 set showmatch

 " Trackpad Scrolling
 set mouse=a

 " VIM AIRLINE 
 set runtimepath+=~/.vim_runtime

 source ~/.vim_runtime/vimrcs/basic.vim
 source ~/.vim_runtime/vimrcs/filetypes.vim
 source ~/.vim_runtime/vimrcs/plugins_config.vim
 source ~/.vim_runtime/vimrcs/extended.vim

 let mapleader = ","
 nmap <leader>ne :NERDTree<cr>
 nmap <leader>n :NERDTreeFind<CR>
 nmap <leader>m :NERDTreeToggle<CR>

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

 let g:airline_theme='minimalist'
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:vim_pbcopy_local_cmd = "pbcopy"

 try
 source ~/.vim_runtime/my_configs.vim
 catch
 endtry
