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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
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

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- colorscheme
    {
      "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
      -- config = function()
      --   vim.cmd("colorscheme gruvbox-material")
      -- end
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
    },
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      opts = {
        ensure_installed = { "efm", "lua_ls" },
        automatic_installation = true,
      },
      event = "BufReadPre",
    },
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      lazy = false,
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
            "go",
            "heex",
            "javascript",
            "html",
            "css",
            "markdown",
            "dockerfile",
            "gitignore",
            "ruby",
            "haskell",
            "racket",
          },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
          },
          indent = { enable = false },
        })
      end
    },
    -- {
    --   "folke/which-key.nvim",
    --   event = "VeryLazy",
    --   opts = {},
    --   keys = {
    --     {
    --       "<leader>?",
    --       function()
    --         require("which-key").show({ global = false })
    --       end,
    --       desc = "Buffer Local Keymaps (which-key)",
    --     },
    --   },
    -- },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "gruvbox-material" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

-- basic keymaps
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- modify x and X to delete text without changing the internal registers
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')
-- vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- KEYMAPS
-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- pane navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- window managment
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
-- toggle minimize
-- vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', { noremap = true, silent = true })

-- OPTIONS
-- Appearence
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = false
vim.opt.colorcolumn = '120'
vim.opt.signcolumn = 'auto'
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

-- setup blank line
require("ibl").setup()
require("mason").setup()
require("mason-lspconfig").setup()

-- setup lsp
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      },
    },
  },
})

-- TODO: fix
lspconfig.elixirls.setup({ cmd = { "elixir-ls" } })

lspconfig.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
