local helper = require("user.helper")

local function init_strategy()
  return function()
    local errors = 200
    vim.treesitter.get_parser():for_each_tree(function(lt)
      if lt:root():has_error() and errors >= 0 then
        errors = errors - 1
      end
    end)
    if errors < 0 then
      return nil
    end
    return require("rainbow-delimiters.strategy.hack")
  end
end

return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    helper.on_clean(function(args)
      rainbow_delimiters.disable(args.buf)
      rainbow_delimiters.enable(args.buf)
    end)

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = init_strategy(false),
        vim = init_strategy(true),
        c = init_strategy(true),
        cpp = init_strategy(true),
      },
      query = {
        [""] = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
