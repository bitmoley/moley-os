--- KEYMAPS ---
-- open netrw
vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>")

-- navigate splits with ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- close windows with leader+q
vim.keymap.set("n", "<leader>q", "<C-w><C-q>")

-- splits
vim.keymap.set("n", "<leader>sv", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader>sh", "<CMD>split<CR>")

-- mini.pick
vim.keymap.set("n", "<leader>fg", "<CMD>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>")

-- lsp handling
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- centre screen when jumping
vim.keymap.set("n", "H", "Hzz")
vim.keymap.set("n", "L", "Lzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
