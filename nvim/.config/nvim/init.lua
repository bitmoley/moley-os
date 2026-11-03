-- map leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.plugins")
require("config.keymaps")
require("config.options")

-- LSP configs
vim.lsp.enable({ "lua_ls", "basedpyright", "ruff", "rust_analyzer", "gopls", "clangd", "ols", "nixd"})

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = { typeCheckingMode = 'recommended' },
    },
  },
})

vim.lsp.config('ruff', {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
})

vim.lsp.log.set_level("ERROR")

-- colourshceme
vim.cmd.colorscheme("kanagawa-wave")
