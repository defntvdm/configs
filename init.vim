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

" sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" yaourt -S ctags ttf-nerd-fonts-symbols ack fzf python-pynvim nodejs yarn rustup
" :CocInstall coc-json coc-tsserver coc-clangd coc-python coc-go coc-rls
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
Plug 'gko/vim-coloresque'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --frozen-lockfile' }
call plug#end()

" coc.nvim
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <leader>n <Plug>(coc-rename)

let g:python3_host_prog = '/usr/bin/python3'
let g:SuperTabDefaultCompletionType = '<Tab>'

"vim-floaterm
let g:floaterm_keymap_toggle = '<F12>'

" tab sizes for python
autocmd FileType python set tabstop=4|set shiftwidth=4

" Change color scheme
colorscheme gruvbox

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
map <F8> :TagbarToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -path ./.git -o -path ./.venv -o -path vendor -o -path .mypy_cache \) -prune -o -print'
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History:<CR>

" vim-go
let g:go_auto_sameids = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
autocmd FileType go nmap <leader>r :GoReferrers<CR>
autocmd FileType go nmap <leader>i :GoImplements<CR>
autocmd FileType go nmap <leader>n :GoRename<CR>

" Ultisnips binding
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" black python
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
let g:black_fast = 1
autocmd FileType python nmap <F9> :Black<CR>

" gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" copy/paste from system clipboard
noremap <leader>y "+y
noremap <leader>p "+P

" comment/uncomment lines
highlight Comment cterm=italic
autocmd FileType python vnoremap <leader>u :'<,'>norm ^x<CR>
autocmd FileType python vnoremap <leader>c :'<,'>norm I#<CR>
autocmd FileType c,cpp,javascript,go vnoremap <leader>u :'<,'>norm ^xx<CR>
autocmd FileType c,cpp,javascript,go vnoremap <leader>c :'<,'>norm I//<CR>

" new tab
nmap <C-t> :tabnew<CR>
