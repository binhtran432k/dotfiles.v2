local format_disableds = {
  html = true,
  cssls = true,
  lua_ls = true,
}

local function format()
  vim.lsp.buf.format({
    async = true,
    timeout_ms = 3000,
    filter = function(client)
      return not vim.tbl_contains(vim.tbl_keys(format_disableds), client.name)
    end,
  })
end

local function get_keymaps()
  return {
    { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
    { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
    { "K", vim.lsp.buf.hover, desc = "Show Hover", mode = "n" },
    { "gI", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },
    { "gr", vim.lsp.buf.references, desc = "Go to references", mode = "n" },
    { "gl", vim.diagnostic.open_float, desc = "Show diagnostics", mode = "n" },
    { "gK", vim.lsp.buf.signature_help, desc = "Show signature help", mode = "n" },
    { "gh", vim.lsp.buf.type_definition, desc = "Go to type definition", mode = "n" },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", mode = "n" },
    {
      "<leader>cf",
      format,
      desc = "Format",
      mode = { "n", "v" },
    },
    {
      "<leader>ca",
      vim.lsp.buf.definition,
      desc = "Show code action",
      mode = { "n", "v" },
    },
  }
end

---@param opts PluginLspOpts
local function lspconfig_config(_, opts)
  -- lspconfig
  local servers = opts.servers
  local capabilities = type(opts.get_completion) == "function" and opts.get_completion() or {}
  capabilities = vim.tbl_deep_extend("force", opts.capabilities, capabilities)

  for server, server_opts in pairs(servers) do
    server_opts = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
    }, server_opts)

    if type(opts.setup[server]) == "function" then
      opts.setup[server](server, server_opts)
    else
      require("lspconfig")[server].setup(server_opts)
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = get_keymaps(),
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        -- float = { border = "rounded" },
      },
      servers = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overriden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      get_completion = nil,
      capabilities = {},
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts: table):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    config = lspconfig_config,
  },
}
