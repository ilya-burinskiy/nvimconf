-- Appearence
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = '120'
vim.opt.signcolumn = 'yes'
-- Behaviour
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.splitright = false
vim.opt.autochdir = false
-- Tab/Indetation
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = false
-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
