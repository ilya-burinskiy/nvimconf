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

-- FINDING FILES
-- vim.cmd("set path+=**")
vim.cmd("set wildmenu")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox-material" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

require("config.keymaps")
require("config.options")

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
-- local luacheck = require("efmls-configs.linters.luacheck")
-- local stylua = require("efmls-configs.formatters.stylua")
-- lspconfig.efm.setup({
--   filetypes = {
--     "lua",
--   },
--   init_options = {
--     documentFormatting = true,
--     documentRangeFormatting = true,
--     hover = true,
--     documentSymbol = true,
--     codeAction = true,
--     completion = true,
--   },
--   settings = {
--     languages = {
--       lua = {
--         luacheck,
--         stylua
--       },
--     },
--   },
-- })
