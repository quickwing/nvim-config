-- Leader key (must be set before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Undo persistence
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Disable netrw (using oil.nvim instead)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Mouse
vim.opt.mouse = "a"

-- Completion menu
vim.opt.completeopt = { "menu", "menuone", "noselect" }
