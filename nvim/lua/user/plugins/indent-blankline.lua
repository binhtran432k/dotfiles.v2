local helper = require("user.helper")

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "CursorMoved" },
  opts = {
    char = "│",
    filetype_exclude = indent_exclude_fts,
    show_trailing_blankline_indent = false,
    show_current_context = false,
  },
  config = function(_, opts)
    helper.on_clean(function()
      vim.cmd("silent! IndentBlanklineRefresh")
    end)
    require("indent_blankline").setup(opts)
  end,
}
