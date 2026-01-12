return {
  {
    "AbysmalBiscuit/insert-inlay-hints.nvim",
    keys = {
      {
        "<leader>uhc",
        function()
          require("insert-inlay-hints").closest()
        end,
        desc = "Insert the closest inline hint",
      },
      {
        "<leader>uhl",
        function()
          require("insert-inlay-hints").line()
        end,
        desc = "Insert all inline hints on current line",
      },
      {
        "<leader>uhv",
        function()
          require("insert-inlay-hints").visual()
        end,
        desc = "Insert all inlay hints in the current visual selection",
        mode = { "v" },
      },
      {
        "<leader>uha",
        function()
          return require("insert-inlay-hints").all()
        end,
        desc = "Insert all inlay hints in the current buffer",
      },
    },
  },
}
