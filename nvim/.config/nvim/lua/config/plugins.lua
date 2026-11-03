vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim", -- colourscheme
  "https://github.com/nvim-mini/mini.nvim", -- mini.nvim
  "https://github.com/nvim-treesitter/nvim-treesitter", -- treesitter
  "https://github.com/neovim/nvim-lspconfig", -- nvim lspconfig
})

-- plugin setup
require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.icons").setup()
require("mini.completion").setup()
require("mini.snippets").setup()
require("mini.pairs").setup()
require("mini.files").setup()
