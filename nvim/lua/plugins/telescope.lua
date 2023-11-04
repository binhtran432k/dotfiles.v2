return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-symbols.nvim" },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")

    opts.defaults.mappings = vim.tbl_extend("force", opts.defaults.mappings, {
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    })
  end,
}
