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
" python3 install.py --all
" Run :CocInstall coc-json coc-tsserver
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
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
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'ycm-core/YouCompleteMe'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ternjs/tern_for_vim'
call plug#end()

" tab sizes for c, cpp, js, ...
autocmd FileType c,cpp,javascript,html,json,yaml set tabstop=2|set shiftwidth=2

" Change color scheme
colorscheme gruvbox

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
map <F8> :TagbarToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" fzf
let $FZF_DEFAULT_COMMAND='find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History:<CR>

" vim-go
let g:go_auto_sameids = 0
let g:go_rename_command = 'gopls'
autocmd FileType go nmap <leader>r :GoReferrers<CR>
autocmd FileType go nmap <leader>i :GoImplements<CR>
autocmd FileType go nmap <leader>n :GoRename<CR>

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
let g:jedi#goto_command = "gd"
let g:jedi#usages_command = "<leader>r"
let g:jedi#rename_command = "<leader>n"

" ternjs
autocmd FileType javascript nmap gd :TernDef<CR>
autocmd FileType javascript nmap <leader>r :TernRefs<CR>
autocmd FileType javascript nmap <leader>n :TernRename<CR>

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" comment/uncomment lines
autocmd FileType python vnoremap <leader>u :'<,'>norm ^x<CR>
autocmd FileType python vnoremap <leader>c :'<,'>norm I#<CR>
autocmd FileType c,cpp,js,go vnoremap <leader>c :'<,'>norm I//<CR>
autocmd FileType c,cpp,javascript,go vnoremap <leader>u :'<,'>norm ^xx<CR>
