syntax on
set background=dark
set colorcolumn=120
set completeopt+=noinsert
set cursorline
set diffopt+=vertical
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set number
set relativenumber
set shiftwidth=2
set smartindent
set t_Co=256
set tabstop=2
set updatetime=1000
set noswapfile
set ignorecase

" sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" yaourt -S ctags ttf-nerd-fonts-symbols ack fzf python-pynvim nodejs yarn rustup
" :CocInstall coc-json coc-tsserver coc-clangd coc-python coc-go coc-rls coc-cmake coc-emmet coc-vetur coc-todolist coc-prettier
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mbbill/undotree'
call plug#end()

" resource this file
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" fix nvim hangs on F3...F11
inoremap <F3> <Nop>
inoremap <F4> <Nop>
inoremap <F5> <Nop>
inoremap <F6> <Nop>
inoremap <F7> <Nop>
inoremap <F8> <Nop>
inoremap <F10> <Nop>

" undo-tree
nnoremap <F11> :UndotreeToggle<CR>

" emmet-vim
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascriptreact,typescriptreact,vue EmmetInstall

" coc.nvim
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
nmap <silent> gc :CocCommand clangd.switchSourceHeader<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <leader>n <Plug>(coc-rename)
nmap <leader>i <Plug>(coc-implementation)
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>d :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" coc-todo
nnoremap <leader>tdc :CocCommand todolist.create<CR>
nnoremap <leader>tdu :CocCommand todolist.upload<CR>
nnoremap <leader>tdd :CocCommand todolist.download<CR>
nnoremap <leader>tdl :CocList todolist<CR>
" coc-prettier
command! -nargs=0 Prettify :CocCommand prettier.formatFile
nnoremap <F9> :Prettify<CR>

let g:python3_host_prog = '/usr/bin/python3'

" tab sizes for python
autocmd FileType python set tabstop=4|set shiftwidth=4

" Change color scheme
colorscheme gruvbox

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
map <F12> :TagbarToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -path ./.git -o -path ./.venv -o -path vendor -o -path .mypy_cache \) -prune -o -print'
nnoremap <leader>f :Files<CR>

" vim-go
let g:go_auto_sameids = 0
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Ultisnips binding
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" black python
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
let g:black_fast = 1
autocmd FileType python nmap <F9> :Black<CR>

" gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" copy/paste from system clipboard
noremap <leader>y "+y
noremap <leader>p "+P

" comment/uncomment lines
highlight Comment cterm=italic
autocmd FileType python vnoremap <leader>u :'<,'>norm ^xx<CR>
autocmd FileType python vnoremap <leader>c :'<,'>norm I# <CR>
autocmd FileType c,cpp,javascript,go vnoremap <leader>u :'<,'>norm ^xxx<CR>
autocmd FileType c,cpp,javascript,go vnoremap <leader>c :'<,'>norm I// <CR>

" new tab
nmap <C-t> :tabnew<CR>

" save
inoremap <F2> <ESC>:w<CR>
nnoremap <F2> :w<CR>
