return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.g.autoformat = false
    end,
    ---@type PluginLspOpts
    opts = {
      servers = {
        emmet_language_server = {},
      },
    },
  },
}
