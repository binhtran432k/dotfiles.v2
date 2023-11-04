return {
  {
    "folke/tokyonight.nvim",
    opts = {
      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        local util = require("tokyonight.util")

        colors.bg = "#282A36"
        colors.fg = "#F8F8F2"
        colors.comment = "#6272A4"
        colors.red = "#FF5555"
        colors.orange = "#FFB86C"
        colors.yellow = "#F1FA8C"
        colors.green = "#50fa7b"
        colors.purple = "#BD93F9"
        colors.cyan = "#8BE9FD"
        colors.magenta = "#FF79C6"

        util.bg = colors.bg
        colors.blue = util.darken(colors.purple, 0.5, colors.cyan)
        colors.teal = util.darken(colors.green, 0.4, colors.cyan)

        colors.bg_dark = util.darken(colors.bg, 0.8, "#000000")
        colors.bg_highlight = util.lighten(colors.bg, 0.95)
        colors.fg_gutter = util.darken(colors.purple, 0.25)

        colors.blue0 = util.darken(colors.purple, 0.8)
        colors.blue1 = util.darken(colors.purple, 0.6, colors.magenta)
        colors.blue2 = util.darken(colors.blue1, 0.9)
        colors.blue5 = util.lighten(colors.cyan, 0.95)
        colors.blue6 = util.lighten(colors.blue5, 0.9)
        colors.blue7 = util.darken(colors.blue0, 0.9)
        colors.green1 = util.darken(colors.green, 0.6, colors.cyan)
        colors.green2 = util.darken(colors.green1, 0.8)
        colors.magenta2 = util.darken(colors.red, 0.5, colors.magenta)
        colors.red1 = util.darken(colors.red, 0.9)

        colors.git.add = util.darken(colors.green2, 0.5)
        colors.git.delete = util.darken(colors.red1, 0.5)
        colors.git.change = util.darken(colors.blue7, 0.5)

        colors.gitSigns.add = util.darken(colors.green2, 0.6)
        colors.gitSigns.delete = util.darken(colors.red1, 0.6)
        colors.gitSigns.change = util.darken(colors.blue7, 0.6)

        colors.diff.add = util.darken(colors.green2, 0.15)
        colors.diff.delete = util.darken(colors.red1, 0.15)
        colors.diff.change = util.darken(colors.blue7, 0.15)
        colors.diff.text = colors.blue7

        colors.git.ignore = colors.dark3
        colors.black = util.darken(colors.bg, 0.8, "#000000")
        colors.border_highlight = util.darken(colors.blue1, 0.8)
        colors.border = colors.black

        -- Popups and statusline always get a dark background
        colors.bg_popup = colors.bg_dark
        colors.bg_statusline = colors.bg_dark

        -- Sidebar and Floats are configurable
        colors.bg_sidebar = colors.bg_dark

        colors.bg_float = colors.bg_dark

        colors.bg_visual = util.darken(colors.blue0, 0.4)
        colors.bg_search = colors.blue0
        colors.fg_sidebar = colors.fg_dark
        colors.fg_float = colors.fg

        colors.error = colors.red1
        colors.warning = colors.yellow
        colors.info = colors.blue2
        colors.hint = colors.teal

        colors.delta.add = util.darken(colors.green2, 0.45)
        colors.delta.delete = util.darken(colors.red1, 0.45)
      end,
    },
  },
}
