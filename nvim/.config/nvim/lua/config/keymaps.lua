-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local map = vim.keymap.set
map({ "n", "x" }, "y", '"+y')
map("n", "Y", '"+Y')

map("n", "<leader>cw", '"_ciw')

-- stop Ctrl+z from suspending NeoVim
map({ "n", "v", "i" }, "<C-z>", "u", { silent = true })

-- restart neovim
map("n", "<leader>R", function()
  -- local session = vim.fn.stdpath("state") .. "/restart_session.vim"
  -- vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  -- vim.cmd("restart source " .. vim.fn.fnameescape(session))
  vim.cmd("restart")
end, { desc = "Restart Neovim" })

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uhs")
end

-- :W == :w
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Q", "quit", {})

-- clear highlighting
-- map({ "n" }, "<C-l>", "<cmd>noh<CR>")

-- append next line without moving the cursor
map("n", "J", "mzJ`z")

-- paste over highligh without loosing the text in buffer
map("x", "<leader>P", '"_dP')

-- start replacing the word you are on in the whole file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make the file executable
map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- jumping to the end backwards
map("n", "<C-e>", "ge")

-- scrolling down without moving the cursor
map("n", "<C-h>", "<C-e>")

-- jumping half page keeps the cursor at the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- LSP renaming
map("n", "<leader>r", ":IncRename ")

-- copy line diagnostics to the systems clipboard
map(
  "n",
  "<leader>cy",
  ":lua vim.diagnostic.open_float()<CR>:lua vim.diagnostic.open_float()<CR>:%y+<CR>:q<CR>",
  { desc = 'Copy Line Diagnostics to "+' }
)

-- copy filename to the systems clipboard
map("n", "<leader>fC", ":let @+ = expand('%:p')<CR>", { desc = 'Copy filepath to "+' })

-- stylua: ignore start
-- copy the contents of 0 register (last yank) to clipboard
map(
  "n",
  "<leader>Y",
  function()
    vim.fn.setreg("+", vim.fn.getreg("0"))
  end,
  { desc = "0 reg -> clipboard"}
)
-- stylua: ignore end
