local function get_toggle_cmp(cmp)
  return function()
    if cmp.visible() then
      cmp.close()
    else
      cmp.complete()
    end
  end
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "path" },
        { name = "buffer" },
        { name = "emoji" },
      })

      local cmp_window_opts = {
        winhighlight = "CursorLine:Visual,Search:None",
      }

      opts.window = {
        completion = cmp.config.window.bordered(cmp_window_opts),
        documentation = cmp.config.window.bordered(cmp_window_opts),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = get_toggle_cmp(cmp),
      })
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")

      local mapping = vim.tbl_extend("force", cmp.mapping.preset.cmdline(), {
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },

        ["<C-Space>"] = { c = get_toggle_cmp(cmp) },
      })

      ---@diagnostic disable-next-line: missing-fields
      cmp.setup.cmdline(":", {
        mapping = mapping,
        sources = {
          { name = "cmdline", group_index = 1 },
          { name = "buffer", group_index = 2 },
        },
      })
      for _, cmd_type in ipairs({ "/", "?" }) do
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline(cmd_type, {
          mapping = mapping,
          sources = {
            { name = "buffer", group_index = 1 },
          },
        })
      end
    end,
  },
}
