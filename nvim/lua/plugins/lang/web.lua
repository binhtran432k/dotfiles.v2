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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "pug" })
      end
    end,
  },
}
