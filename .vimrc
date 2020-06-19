"""
filetype off
filetype plugin indent on
syntax on

set nu
set number relativenumber
set nocompatible
set hidden
set noerrorbells
set number
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set undodir=~/.vim/undodir
set undofile
set nu rnu
set nowrap
set cursorline
set smartcase
set noswapfile
set nobackup
set hlsearch
set clipboard=unnamed
set bg=dark
set wildignore+=*/node_modules/*
set tags=./tags,tags;$HOME

"
" Give more space for displaying messages.
set cmdheight=2

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

"
" Autocompletion
set wildmode=longest,list,full

call plug#begin()

Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mgechev/vim-jsx'
Plug 'junegunn/vim-easy-align'
Plug 'gruvbox-community/gruvbox'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

colorscheme gruvbox

" NERDTreee
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
autocmd FileType nerdtree setlocal relativenumber
nmap <C-e> :NERDTree<CR>

"Coc Explorer
nmap <space>e :CocCommand explorer<CR>

" FZF key bindings
nnoremap <C-f> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Prettier 
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Move between windows.
" xnoremap <C-h> <C-w>h
" xnoremap <C-j> <C-w>j
" xnoremap <C-k> <C-w>k
" xnoremap <C-l> <C-w>l

" xnoremap K :move '<-2<CR>gv=gv
" xnoremap J :move '<+1<CR>gv=gv

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart


xnoremap <C-k> :move '<-2<cr>gv
xnoremap <C-j> :move '>+<cr>gv

cnoreabbrev vt vert term

autocmd FileType tsx setlocal commentstring={/*\ %s\ */}
autocmd FileType jsx setlocal commentstring={/*\ %s\ */}

xnoremap p pgvy

