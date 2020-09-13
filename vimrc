syntax enable
filetype plugin indent on

" ==========
" Plugins
" ==========

" Install vim-plug automatically
if has("nvim")
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'

call plug#end()

" ==========
" Settings
" ==========
" Neovim creates undo directory by default
if !has("nvim")
  if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
  endif
  set undodir=~/.vim/undo-dir
endif

set undofile

" Remap keys (\b) to buffer list and number
nnoremap <leader>b :ls<cr>:b<space>

" Map FZF :Files to CTRL-P
nnoremap <C-p> :Files<Cr>

" Map FZF :Tags to CTRL-F
nnoremap <C-f> :Rg<CR>

" Map TagBar to F8
nmap <F8> :TagbarToggle<CR>

" Column at 80 characters
set colorcolumn=80

" Sign column on
" set signcolumn=number

" Don't show mode at bottom under airline
set noshowmode

" Don't show line numbers when editing file
set shortmess=F

" Hybrid numbers
set number

set laststatus=2

let g:lightline = { 'colorscheme': 'nord' }

set background=dark
set termguicolors
colorscheme nord
