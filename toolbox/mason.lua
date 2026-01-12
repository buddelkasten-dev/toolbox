return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "pyright",
      "typescript-language-server",
      "bash-language-server",
      "json-lsp",
      "yaml-language-server",
      "marksman",
      "stylua",
      "prettier",
      "shfmt",
      "black",
      "isort",
      "ruff",
    },
  },
}