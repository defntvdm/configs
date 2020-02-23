syntax on
set number
set relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set t_Co=256
set cursorline
set diffopt+=vertical
set hlsearch
set updatetime=1000
set colorcolumn=120

" Don't forgive install vim-plug
" ctags package for tagbar
" ack for ack.vim
" fzf for fzf.vim
call plug#begin('~/.vim/plugged')
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gko/vim-coloresque'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
call plug#end()

" Change color scheme
colorscheme gruvbox

" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" Files
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History:<CR>

" vim-go
" let g:go_auto_sameids = 1

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
