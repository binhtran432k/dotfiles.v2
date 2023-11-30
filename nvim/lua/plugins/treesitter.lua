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
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close_on_slash = false,
    },
  },
}
