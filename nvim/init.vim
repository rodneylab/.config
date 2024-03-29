" based on https://www.jakewiesler.com/blog/getting-started-with-vim

" enable syntax highlighting
syntax on

" termguicolors enabled for Neovide in neovide.lua
set notermguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" opens splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse suport
set mouse=a

" case insensitive search unless captial letters are used
set ignorecase
set smartcase

" hide inbuilt mode (using lightline for this)
set noshowmode

set guifont=JetBrains\ Mono:h14

" system clipboard
set clipboard+=unnamedplus 

call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lightline
Plug 'itchyny/lightline.vim'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" gitsigns
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Glow Markdown previews
Plug 'ellisonleao/glow.nvim'

" Autopairs
Plug 'windwp/nvim-autopairs'

" Trouble: panel for errors and warnings
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" key mappings with `[` and `]`
Plug 'https://tpope.io/vim/unimpaired'

" file explorer
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

set background=dark

colorscheme onedark

if exists("g:neovide")
    colorscheme catppuccin
endif

lua require('rodneylab')
