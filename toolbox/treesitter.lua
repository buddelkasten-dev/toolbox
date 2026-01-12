return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "bash",
      "json",
      "yaml",
      "toml",
      "markdown",
    },
    auto_install = false,
  },
}