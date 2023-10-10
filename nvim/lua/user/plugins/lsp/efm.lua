return {
  {
    "creativenull/efmls-configs-nvim",
    version = "v1.x.x", -- version is optional, but recommended
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        efm = {},
      },
      setup = {
        efm = function(_, server_opts)
          local languages = require("efmls-configs.defaults").languages()
          languages.nix = nil;
          local efmls_config = {
            filetypes = vim.tbl_keys(languages),
            settings = {
              rootMarkers = { ".git/" },
              languages = languages,
            },
            init_options = {
              documentFormatting = true,
              documentRangeFormatting = true,
            },
          }
          require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, server_opts))
        end,
      },
    },
  },
}
