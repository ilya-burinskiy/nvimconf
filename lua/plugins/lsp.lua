return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = { "efm", "lua_ls" },
      automatic_installation = true,
    },
    event = "BufReadPre",
}
