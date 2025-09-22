return {
  "MysticalDevil/inlay-hints.nvim",
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  keys = {
    { "<leader>z", "<cmd>InlayHintsToggle<CR>", desc = "InlayHintsToggle" },
  },
  config = function()
    require("inlay-hints").setup({
      commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
      autocmd = { enable = false }, -- Enable the inlay hints on `LspAttach` event
    })
  end,
}
