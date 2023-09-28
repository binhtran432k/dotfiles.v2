return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local api = require("typescript-tools.api")
      require("typescript-tools").setup {
        handlers = {
          ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
            { 80001 }
          ),
        },
      }
    end,
  },
}
