local function setup_ft(pattern, callback)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = callback,
  })
end

local function setup_ft_textwidth(opts)
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(event)
      if not vim.b["editorconfig"] or not vim.b["editorconfig"].max_line_length then
        if vim.bo[event.buf].modifiable then
          local length = opts[vim.bo[event.buf].filetype]
          if not length then
            length = 80
          end
          vim.bo[event.buf].textwidth = length
        else
          vim.bo[event.buf].textwidth = 0
        end
      end
    end,
  })
end

local function setup()
  -- Close some filetypes with <q>
  setup_ft({
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  }, function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end)

  setup_ft_textwidth {
    lua = 120,
    java = 100,
    rust = 100,
  }

  vim.filetype.add {
    extension = { conf = "config" },
    filename = { ["binding.gyp"] = "jsonc" },
    pattern = { [".*/test/corpus/.*%.txt"] = "treesitter-test" },
  }
end

return {
  setup = setup
}
