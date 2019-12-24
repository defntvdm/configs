syntax on
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set t_Co=256
set cursorline

" Don't forgive install vim-plug
call plug#begin('~/.vim/plugged')
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
call plug#end()

" Change color scheme
colorscheme gruvbox

" Enable NERDTree and bind Ctrl+n
autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>

