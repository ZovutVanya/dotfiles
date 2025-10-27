return {
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
      { "<leader>zs", "<cmd>InlayHintsToggle<CR>", desc = "InlayHintsToggle" },
    },
    config = function()
      require("inlay-hints").setup({
        commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
        autocmd = { enable = false }, -- Enable the inlay hints on `LspAttach` event
      })
    end,
  },

  {
    "AbysmalBiscuit/insert-inlay-hints.nvim",
    keys = {
      {
        "<leader>zc",
        function()
          require("insert-inlay-hints").closest()
        end,
        desc = "Insert the closest inline hint",
      },
      {
        "<leader>zl",
        function()
          require("insert-inlay-hints").line()
        end,
        desc = "Insert all inline hints on current line",
      },
      {
        "<leader>zv",
        function()
          require("insert-inlay-hints").visual()
        end,
        desc = "Insert all inlay hints in the current visual selection",
        mode = { "v" },
      },
      {
        "<leader>za",
        function()
          return require("insert-inlay-hints").all()
        end,
        desc = "Insert all inlay hints in the current buffer",
      },
    },
  },
}
