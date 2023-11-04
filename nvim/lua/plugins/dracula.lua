return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    dev = true,
    opts = {},
  },
}
