return {
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
}
