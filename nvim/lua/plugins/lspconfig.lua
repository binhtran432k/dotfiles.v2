return {
  {
    "neovim/nvim-lspconfig",
    ---@type PluginLspOpts
    opts = {
      diagnostics = {
        float = { border = "rounded" },
      },
      servers = {
        emmet_language_server = { mason = true },
        html = {},
        cssls = {},
      },
    },
  },
}
