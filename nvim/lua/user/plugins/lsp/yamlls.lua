return {
  {
    "neovim/nvim-lspconfig",
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
