" based on https://www.jakewiesler.com/blog/getting-started-with-vim

" enable syntax highlighting
syntax on

" termguicolors enabled for Neovide in neovide.lua
set notermguicolors

" number of spaces in a <Tab>
" set tabstop=4
" set softtabstop=4
" set expandtab

" enable autoindents
" set smartindent
filetype plugin indent on

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
" set number
" set relativenumber

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" opens splits intuitively
" set splitbelow
" set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

"set backspace=indent,eol,start
" hide inbuilt mode (using lightline for this)
set noshowmode

set guifont=Iosevka\ Custom,JetBrains\ Mono,IosevkaTerm\ NF:h13.5:#e-subpixelantialias
set linespace=5
" set neovide_scale_factor=1.0

" system clipboard
"set clipboard+=unnamedplus

" completion
set completeopt=menuone,noselect,noinsert

lua require('rodneylab.core')

call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

" Lightline
" Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" gitsigns
Plug 'lewis6991/gitsigns.nvim'

" Lazygit
Plug 'kdheepak/lazygit.nvim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Mason tooling management
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" Plug 'simrat39/rust-tools.nvim' deprecated, replaced by mrcjkb/rustaceanvim
Plug 'mrcjkb/rustaceanvim'
Plug 'saecki/crates.nvim', { 'tag': 'stable' }
Plug 'rafamadriz/friendly-snippets'

" Linting
Plug 'mfussenegger/nvim-lint'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'windwp/nvim-ts-autotag'

" Theme
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rebelot/kanagawa.nvim', { 'as': 'kanagawa'}
Plug 'sainnhe/sonokai', { 'as': 'sonokai'}

" Glow Markdown previews
Plug 'ellisonleao/glow.nvim'

" Autopairs
Plug 'windwp/nvim-autopairs'

" Trouble: panel for errors and warnings
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

Plug 'folke/todo-comments.nvim'

" key mappings with `[` and `]`
Plug 'https://tpope.io/vim/unimpaired'

" comments
Plug 'https://tpope.io/vim/commentary'

" file explorer
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" tab styling
Plug 'akinsho/bufferline.nvim'

" Formatting
Plug 'stevearc/conform.nvim'

" lldb
Plug 'sakhnik/nvim-gdb'

" icon-picker for Emoji
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'

" Glow Makrkdown preview
Plug 'ellisonleao/glow.nvim'

call plug#end()

set background=dark
colorscheme onedark

if exists("g:neovide")
    colorscheme catppuccin
endif

lua require('rodneylab.plugins')
