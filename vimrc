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
" ttf-nerd-fonts-symbols for devicons
" ack for ack.vim
" fzf for fzf.vim
" python3 install.py --clang-completer --js-completer --ts-completer for ycm
call plug#begin('~/.vim/plugged')
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
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
Plug 'ycm-core/YouCompleteMe'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
" :CocInstall coc-tsserver coc-json
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" tab sizes for c, cpp, js
autocmd FileType c set tabstop=2|set shiftwidth=2
autocmd FileType cpp set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2

" Change color scheme
colorscheme gruvbox

" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History:<CR>

" vim-go
let g:go_auto_sameids = 0
autocmd FileType go nmap <leader>r :GoReferrers<CR>
autocmd FileType go nmap <leader>i :GoImplements<CR>

" YCM
let g:ycm_key_list_select_completion = ['<C-o>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" black python
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
let g:black_fast = 1
autocmd FileType python nmap <F9> :Black<CR>

" gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" jedi-vim
let g:jedi#popup_on_dot = 0

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
