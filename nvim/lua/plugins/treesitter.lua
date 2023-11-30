return {
  {
    "mizlan/iswap.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = {
      "ISwapNodeWith",
      "ISwapNode",
      "ISwapNodeWithRight",
      "ISwapNodeWithLeft",
    },
    config = true,
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<leader>cc", "<cmd>Neogen<cr>", desc = "Neogen document" },
    },
    cmd = "Neogen",
    opts = {
      -- input_after_comment = false,
      enable_placeholders = false,
      snippet_engine = nil, -- "luasnip"
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {},
  },
}
