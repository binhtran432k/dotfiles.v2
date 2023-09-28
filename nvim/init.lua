local option = require("user.option")
local pack = require("user.pack")
local filetype = require("user.filetype")

option.setup()
pack.setup()
filetype.setup()

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("user.autocmd").setup()
    require("user.keymap").setup()
  end
})
