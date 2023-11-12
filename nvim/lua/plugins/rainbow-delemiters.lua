--- Get rainbow delimiters strategy base on errors
---@return table?
local function get_strategy()
  local errors = 200
  for _, tree in ipairs(vim.treesitter.get_parser():trees()) do
    if tree:root():has_error() then
      errors = errors - 1
    elseif errors <= 0 then
      return nil
    end
  end
  return require("rainbow-delimiters").strategy.global
end

return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = get_strategy,
      },
      query = {
        [""] = "rainbow-delimiters",
        ["javascript"] = "rainbow-delimiters-react",
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
