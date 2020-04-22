" neovim configuration file
" 2020-04-14
if has('nvim')
	call plug#begin('~/.config/nvim/bundle')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-surround'
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'zchee/deoplete-jedi'
	Plug 'mattn/emmet-vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-markdown'
"	Plug 'ajh17/VimCompletesMe'
"	Plug 'Valloric/YouCompleteMe'
	Plug 'lyuts/vim-rtags'
	Plug 'fatih/vim-go'
	Plug 'leafgarland/typescript-vim'
    Plug 'ap/vim-css-color'
    Plug 'junegunn/goyo.vim'
    Plug 'unblevable/quick-scope'
" Color-schemes
	Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'jacoborus/tender.vim'
    Plug 'romainl/Apprentice'
    Plug 'nanotech/jellybeans.vim'
    Plug 'ajh17/Spacegray.vim'
"Call PlugInstall to install new plugins
	call plug#end()
endif

" basics
filetype plugin indent on
syntax on

set ai
set bs=2
set showmatch
set laststatus=2
set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
set colorcolumn=81
set softtabstop=4
set autoindent
set cursorline
set cursorcolumn
set number relativenumber
set autoread
set ignorecase
set fileencodings=utf-8,gbk
set hls is
set ic
set mouse=a
set nocompatible
set noswapfile
set cmdheight=1
if has('gui_running')
	set background=light
else
	set background=dark
endif

set guifont=Monaco:h12
colorscheme PaperColor

" map the leader key
let mapleader=" "

" Vim Quickscope
" Trigger a highlight in the appropriate direction when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guibg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guibg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Use system clipboard
set clipboard+=unnamedplus

" ---- Basic AutoCmd ----
"  Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.md  set filetype=markdown
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_au

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Status-line
set statusline=
set statusline=%#PmenuSel#
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
set statusline+=%=            "Right side settings"
set statusline+=%#DiffChange#
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]        "Shows buffer id"


" Key mapping
nmap <F5> :NERDTreeToggle<cr>
map <C-g> :Goyo<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>

nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Move lines up and down visually
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Compile and open output
map <leader>G :w! \| !comp <c-r>%<CR><CR>
map <leader>o :!opout <c-r>%<CR><CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Alias replace all to S
nnoremap S :%s//gI<Left><Left><Left>

" Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" Autocompletion
set wildmode=longest,list,full

"Save file as sudo when no sudo permissions
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

