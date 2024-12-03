local opt = vim.opt

-- adds line numbers
opt.number = true
opt.relativenumber = true

-- number of spaces in a <Tab>
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

-- enable autoindents
opt.smartindent = true
--filetype plugin indent on

-- number of spaces used for autoindents
opt.shiftwidth = 4

-- opt.wrap=false

-- case insensitive search unless capital letters are used
opt.ignorecase = true
opt.smartcase = true

-- highlight the current cursor linr
-- opt.cursorline=true

opt.termguicolors = false
opt.background = dark
--colorscheme onedark
-- opt.signcolumn

opt.backspace = indent, eol, start

-- system clipboard
opt.clipboard:append("unnamedplus")

-- opens splits intuitively
opt.splitbelow = true
opt.splitright = true
