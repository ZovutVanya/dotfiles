return {
  "gerazov/toggle-bool.nvim",
  config = function()
    require("toggle-bool").setup({
      mapping = "<leader>tt",
    })
  end,
  keys = {
    {
      "<leader>tt",
      desc = "toggle boolean on line",
      mode = { "n", "v" },
    },
  },
}
