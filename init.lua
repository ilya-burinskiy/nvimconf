-- :let @/ = "" почистить поиск

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("set nocompatible")
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.cmd("set foldmethod=manual")
vim.cmd("set background=dark")
vim.cmd("colorscheme vim")

-- FINDING FILES
-- vim.cmd("set path+=**")
vim.cmd("set wildmenu")

-- basic keymaps
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of line" })

-- pane navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = "Previous buffer" })

-- text moving
vim.keymap.set('n', '<A-j>', ':m .+1<CR>', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- window managment
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })

-- OPTIONS
-- Appearence
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = false
vim.opt.colorcolumn = '120'
vim.opt.signcolumn = 'auto'
vim.opt.showmatch = true
vim.opt.cmdheight = 1
-- Behaviour
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.splitright = false
vim.opt.autochdir = false
vim.opt.path:append('**')
vim.opt.modifiable = true
vim.opt.encoding = 'UTF-8'
vim.opt.autoread = true
vim.opt.autowrite = false
-- Tab/Indetation
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
