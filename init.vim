call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'knsh14/vim-github-link'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'simrat39/rust-tools.nvim'
    let NERDTreeShowHidden=1

    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer',
    Plug 'onsails/lspkind-nvim'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lua'   
    Plug 'hrsh7th/cmp-nvim-lsp' 
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'L3MON4D3/LuaSnip'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set termguicolors
colorscheme gruvbox
let mapleader = ","

if has("nvim")
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

syntax on
filetype plugin indent on

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set nospell
set visualbell
set incsearch
set ignorecase
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set splitbelow
set splitright
set exrc
set secure
set undolevels=1000
set backspace=indent,eol,start
set clipboard=unnamedplus
set virtualedit=onemore
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set lcs+=space:·
set undofile
set undodir=~/.vimundo/
set expandtab

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:airline_powerline_fonts = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fg <cmd>Rg<cr>
nnoremap <leader>fb <cmd>Buffers<cr>

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
noremap <Leader>w :update<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>cf :let @*=expand("%:p")<CR>

" Find elixir files and give them elixir filetype
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

" Use LSP omni-completion in elixir files.
autocmd FileType elixir setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-l> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-m> <cmd>lua vim.diagnostic.goto_next()<CR>

autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.heex lua vim.lsp.buf.formatting_sync(nil, 100)

set completeopt=menu,menuone,noselect

:lua require('config')
:lua require('lsp_installer')
:lua require('lsp_config')
:lua require('cmp_config')
:lua require('tailwind_config')
:lua require('trouble_config')
:lua require('solargraph_config')
:lua require('colorizer_config')
:lua require('treesitter')
:lua require('rust_config')

