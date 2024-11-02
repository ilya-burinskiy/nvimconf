-- BASIC SETUP:
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.hlsearch = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- modify x and X to delete text without changing the internal registers
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')
-- vim.keymap.set({'n', 'x'}, 'X', '"_d')

vim.cmd("set nocompatible")
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.cmd("set foldmethod=manual")
vim.cmd("set background=dark")

-- FINDING FILES
vim.cmd("set path+=**")
vim.cmd("set wildmenu")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function ()
				local configs = require("nvim-treesitter.configs")
				configs.setup({
					ensure_installed = {
						"c",
						"lua",
						"vim",
						"vimdoc",
						"query",
						"elixir",
						"heex",
						"javascript",
						"html",
						"ruby",
						"haskell",
						"racket",
					},
					highlight = { enable = true },
					indent = { enable = false },
				})
			end
		},
    { "sainnhe/gruvbox-material" },
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
  },
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.cmd("colorscheme gruvbox-material")
