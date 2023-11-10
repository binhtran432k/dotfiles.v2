return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "neovim/nvim-lspconfig",
    ---@type PluginLspOpts
    opts = {
      servers = {
        emmet_language_server = { mason = true },
        eslint = {},
        html = {},
        cssls = {},
      },
    },
  },
}
