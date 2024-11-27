-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   config = function ()
--     local configs = require("nvim-treesitter.configs")
--     configs.setup({
--       ensure_installed = {
--         "c",
--         "lua",
--         "vim",
--         "vimdoc",
--         "query",
--         "elixir",
--         "heex",
--         "javascript",
--         "html",
--         "ruby",
--         "haskell",
--         "racket",
--       },
--       highlight = { enable = true },
--       indent = { enable = false },
--     })
--   end
-- }
local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
