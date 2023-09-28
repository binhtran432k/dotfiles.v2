local function setup()
  -- Check if we need to reload the file when it changed
  vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

  -- Highlight on yank
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  -- fix directory buffer is view in buf list
  vim.api.nvim_create_autocmd({ "BufAdd" }, {
    callback = function(event)
      if vim.fn.isdirectory(vim.fn.bufname(event.buf)) == 1 then
        vim.bo[event.buf].buflisted = false
      end
    end,
  })
end

return {
  setup = setup,
}
