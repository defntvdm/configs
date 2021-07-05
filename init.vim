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
set shiftwidth=4
set smartindent
set t_Co=256
set tabstop=4
set updatetime=1000
set noswapfile
set ignorecase
set exrc
set secure

highlight Comment cterm=italic

" sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" yaourt -S ctags ttf-nerd-fonts-symbols ack fzf python-pynvim nodejs yarn rustup
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'psf/black', { 'tag': '21.5b1' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mbbill/undotree'
Plug 'vim-scripts/spacehi.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'mhinz/vim-signify'
call plug#end()

" Coc Extensions
let g:coc_global_extensions = [
            \"coc-json", "coc-tsserver", "coc-clangd", "coc-pyright", "coc-go", "coc-rust-analyzer",
            \"coc-cmake", "coc-emmet", "coc-vetur", "coc-prettier", "coc-yaml", "coc-snippets",
            \]

" resource this file
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" fix nvim hangs on F3...F11
inoremap <F6> <Nop>
inoremap <F7> <Nop>
inoremap <F8> <Nop>
inoremap <F10> <Nop>

" save
inoremap <F2> <ESC>:w<CR>
nnoremap <F2> :w<CR>

" F3 is for space.hi

" Cut trailing whitespaces
nnoremap <F4> :%s/\s\+$//e<CR>

" Buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

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
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <leader>r <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>d :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" coc-prettier
command! -nargs=0 Prettify :CocCommand prettier.formatFile
nnoremap <F9> :Prettify<CR>:w<CR>

let g:python3_host_prog = '/home/defntvdm/.pyenv/shims/python3'

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

" black python
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
let g:black_fast = 0
autocmd FileType python nmap <F9> :Black<CR>:w<CR>

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" copy/paste using system clipboard
vnoremap <C-c>c "+y
noremap <C-v>v "+P

" new tab
nmap <C-t> :tabnew<CR>

" copy directory of current file
nmap <silent> cp :let @+=expand("%:p:h")<CR>

" vim-clang-format
autocmd FileType cpp nmap <F9> :ClangFormat<CR>:w<CR>
