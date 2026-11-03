--- EDITOR OPTIONS ---
vim.o.number = true -- line numbers
vim.o.relativenumber = true
vim.o.showmode = false

vim.o.tabstop = 2 -- set tab size to 2 spaces
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.winborder = "rounded"

vim.o.ignorecase = true -- search settings
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true -- visual settings
vim.o.cursorline = false    -- highlight cursor
vim.o.breakindent = true   -- Enable break indent
vim.o.undofile = true      -- Save undo history
vim.o.updatetime = 250     -- Decrease update time
vim.o.timeoutlen = 300     -- Decrease mapped sequence wait time

vim.o.spelllang = "en_gb"

--- MARKDOWN TEXT WRAPPING ---
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 120
    vim.opt.spell = true
  end,
})

vim.diagnostic.config({
  virtual_lines = { current_line = true }
})

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  lead = "·",
}
